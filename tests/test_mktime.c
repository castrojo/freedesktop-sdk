#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <string.h>

int failed = 0;

void test_mktime(const char *tz, int year, int month, int mday, int hour, time_t expected, int test_num) {
	struct tm tm;
	char *tz_str = malloc(strlen(tz) + 1);
	strcpy(tz_str, tz);

	putenv(tz_str);
	tzset();

	tm.tm_sec = tm.tm_min = 0;
	tm.tm_hour = hour;
	tm.tm_mday = mday;
	tm.tm_mon = month;
	tm.tm_year = year - 1900;
	tm.tm_isdst = -1;

	time_t ret = mktime(&tm);

	if (ret != expected) {
		fprintf(stderr, "FAIL %d: tz=%s, got=%ld, expected=%ld\n", test_num, tz, ret, expected);
		failed = test_num;
	} else {
		printf("PASS %d: tz=%s\n", test_num, tz);
	}
}

int main() {
	// Wednesday 01 January 2020 12:00:00 PM UTC
	test_mktime("TZ=UTC", 2020, 0, 1, 12, 1577880000L, 1);
	// Wednesday 01 July 2020 12:00:00 PM UTC
	test_mktime("TZ=UTC", 2020, 6, 1, 12, 1593604800L, 2);
	// Wednesday 01 January 2020 12:00:00 PM UTC
	test_mktime("TZ=Europe/London", 2020, 0, 1, 12, 1577880000L, 3);
	// Wednesday 01 July 2020 11:00:00 AM UTC <Wednesday 01 July 2020 12:00:00 PM BST>
	test_mktime("TZ=Europe/London", 2020, 6, 1, 12, 1593601200L, 4);
	// Tuesday 31 December 2019 11:00:00 PM UTC <Wednesday 01 January 2020 12:00:00 PM NZDT>
	test_mktime("TZ=Pacific/Auckland", 2020, 0, 1, 12, 1577833200L, 5);
	// Wednesday 01 July 2020 12:00:00 AM UTC <Wednesday 01 July 2020 12:00:00 PM NZST>
	test_mktime("TZ=Pacific/Auckland", 2020, 6, 1, 12, 1593561600L, 6);

	if (failed) {
		fprintf(stderr, "\nSome tests failed\n");
		exit(1);
    } else {
    	printf("\nAll tests passed\n");
    	exit(0);
    }
}
