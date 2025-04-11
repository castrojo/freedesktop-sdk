#!/bin/bash
set -eu
export G_DEBUG=fatal_warnings

test_plugin() {
    local plugin_name=$1
    local pipeline=$2
    
    echo "Plugin [$plugin_name]"
    gst-launch-1.0 -q $pipeline
    echo "- Test Pass"
}

declare -A plugins
plugins=(
    # Examples are from https://gstreamer.freedesktop.org/documentation/
    # gstreamer plugin
    ["gif"]="videotestsrc num-buffers=10 ! videoconvert ! gifenc ! filesink location=test.gif"
    # gstreamer-plugins-bad
    ["videodiff"]="videotestsrc num-buffers=5 pattern=ball ! videodiff ! videoconvert ! autovideosink"
    # gstreamer-plugins-good
    ["jpegenc"]="videotestsrc num-buffers=5 ! jpegenc ! avimux ! filesink location=mjpeg.avi"
    # gstreamer-plugins-base
    ["videoconvert"]="videotestsrc num-buffers=5 ! video/x-raw,format=YUY2 ! videoconvert ! autovideosink"
    # x264enc and avdec_h264 via codecs-extra
    ["videotestsrc"]="videotestsrc num-buffers=10 ! x264enc ! avdec_h264 ! videoconvert ! autovideosink"
    # avenc_aac and avdec_aac via ffmpeg in codecs-extra
    ["libavaac"]="audiotestsrc num-buffers=500 ! audioconvert ! audio/x-raw,rate=44100,channels=2 ! avenc_aac ! avdec_aac ! audioconvert ! fakesink sync=false"
    )

for plugin in "${!plugins[@]}"; do
    test_plugin "$plugin" "${plugins[$plugin]}"
done

if [ -f mjpeg.avi ]; then
    rm mjpeg.avi
fi

if [ -f test.gif ]; then
    rm test.gif
fi

unset G_DEBUG
