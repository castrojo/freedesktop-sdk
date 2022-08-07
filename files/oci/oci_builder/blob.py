# Copyright (c) 2019, 2020 Codethink Ltd.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import tempfile
import hashlib
import os
import codecs
import json
from contextlib import contextmanager


class Blob:
    def __init__(self, global_conf, media_type=None, text=False, legacy_config=None):
        self.global_conf = global_conf
        self.descriptor = None
        self.media_type = media_type
        self.text = text
        self.filename = None
        self.legacy_config = {}
        if legacy_config:
            self.legacy_config.update(legacy_config)
        self.legacy_id = None

    @contextmanager
    def create(self):
        with tempfile.NamedTemporaryFile(mode='w+b',
                                         dir=self.global_conf.output,
                                         delete=False) as file:
            filename = file.name
            try:
                if self.text:
                    yield codecs.getwriter('utf-8')(file)
                else:
                    yield file
                self.descriptor = {}
                if self.media_type:
                    self.descriptor['mediaType'] = self.media_type
                file.seek(0, 2)
                self.descriptor['size'] = file.tell()
                file.seek(0)
                file_hash = hashlib.sha256()
                while True:
                    data = file.read(16*1204)
                    if len(data) == 0:
                        break
                    file_hash.update(data)
                hexdigest = file_hash.hexdigest()
                if self.global_conf.mode == 'oci':
                    self.descriptor['digest'] = f'sha256:{hexdigest}'
                    os.makedirs(os.path.join(self.global_conf.output,
                                             'blobs',
                                             'sha256'),
                                exist_ok=True)
                    self.filename = os.path.join(self.global_conf.output,
                                                 'blobs',
                                                 'sha256',
                                                 file_hash.hexdigest())
                else:
                    assert self.global_conf.mode == 'docker'
                    if self.media_type.endswith('+json'):
                        self.filename = os.path.join(
                            self.global_conf.output,
                            '{hexdigest}.json'
                        )
                        self.descriptor = '{hexdigest}.json'
                    elif self.media_type.startswith('application/vnd.oci.image.layer.v1.tar'):
                        blobdir = os.path.join(self.global_conf.output, file_hash.hexdigest())
                        os.makedirs(blobdir)
                        self.filename = os.path.join(blobdir, 'layer.tar')
                        with open(
                            os.path.join(blobdir, 'VERSION'),
                            'w',
                            encoding="utf-8",
                        ) as version_file:
                            version_file.write('1.0')
                        self.legacy_config['id'] = file_hash.hexdigest()
                        self.legacy_id = file_hash.hexdigest()
                        with open(
                            os.path.join(blobdir, 'json'),
                            'w',
                            encoding='utf-8',
                        ) as legacy_config_file:
                            json.dump(self.legacy_config, legacy_config_file)
                        self.descriptor = os.path.join(file_hash.hexdigest(), 'layer.tar')
                    else:
                        assert False
                os.rename(filename, self.filename)
            except:
                try:
                    os.unlink(filename)
                except: # pylint: disable=bare-except
                    pass
                raise
