import unittest
from datetime import datetime

import pytz

from app.utility_time_zone import UtilityTimeZone


class TestDateManipulations(unittest.TestCase):

    def setUp(self):
        self.utility_time_zone = UtilityTimeZone

    def test_localize_datetime(self):
        # Test data
        naive_datetime = datetime(2023, 10, 17, 12, 0, 0)  # Naive datetime
        timezone_str = 'America/Montreal'

        # Expected result
        expected_timezone = pytz.timezone(timezone_str)
        expected_localized_datetime = expected_timezone.localize(naive_datetime)

        # Call the method
        localized_datetime = UtilityTimeZone.localize_datetime(naive_datetime, timezone_str)

        self.assertEqual(localized_datetime, expected_localized_datetime)
        self.assertIsNotNone(localized_datetime.tzinfo)
        self.assertEqual(localized_datetime.tzinfo.zone, expected_timezone.zone)

    def test_localize_datetime_invalid_timezone(self):
        # Test case where an invalid timezone is provided
        naive_datetime = datetime(2023, 10, 17, 12, 0, 0)
        invalid_timezone = 'Invalid/Timezone'

        with self.assertRaises(pytz.UnknownTimeZoneError):
            UtilityTimeZone.localize_datetime(naive_datetime, invalid_timezone)

    # Eastern Time Zones (North America):
    #
    # Eastern Standard Time (EST): UTC-5
    # - Runs from the first Sunday in November until the second Sunday in March.
    #   Example: November 5, 2023 - March 10, 2024
    #
    # Eastern Daylight Time (EDT): UTC-4
    # - Runs from the second Sunday in March until the first Sunday in November.
    #   Example: March 10, 2024 - November 3, 2024
    #
    # Note: The exact dates for the transitions between EST and EDT may vary slightly each year,
    # but they follow this general pattern based on U.S. daylight saving time rules.

    def test_convert_naive_datetime_raises_error(self):
        # Test case for naive datetime
        naive_datetime = datetime(2024, 1, 1, 12, 0, 0)  # Naive datetime (no tzinfo)

        with self.assertRaises(ValueError) as context:
            UtilityTimeZone.convert_datetime_to_utc(naive_datetime)

        self.assertEqual(str(context.exception), "Trying to convert a naive datetime to UTC")

    def test_convert_standard_time_to_utc(self):
        # Test case for Standard Time (EST: UTC-5) - January 1, 2024
        eastern = pytz.timezone('America/Montreal')
        standard_time = eastern.localize(datetime(2024, 1, 1, 12, 0, 0))  # EST time

        # Convert to UTC
        utc_datetime = UtilityTimeZone.convert_datetime_to_utc(standard_time)

        # Expected result: 12:00 PM EST is 5:00 PM UTC
        expected_utc = datetime(2024, 1, 1, 17, 0, 0, tzinfo=pytz.utc)

        self.assertEqual(utc_datetime, expected_utc)

    def test_convert_dst_time_to_utc(self):
        # Test case for Daylight Saving Time (EDT: UTC-4) - June 1, 2024
        eastern = pytz.timezone('America/Montreal')
        dst_time = eastern.localize(datetime(2024, 6, 1, 12, 0, 0))  # EDT time

        # Convert to UTC
        utc_datetime = UtilityTimeZone.convert_datetime_to_utc(dst_time)

        # Expected result: 12:00 PM EDT is 4:00 PM UTC
        expected_utc = datetime(2024, 6, 1, 16, 0, 0, tzinfo=pytz.utc)

        self.assertEqual(utc_datetime, expected_utc)

    def test_convert_utc_datetime(self):
        # Test case for already UTC-aware datetime
        utc_datetime = datetime(2024, 10, 17, 12, 0, 0, tzinfo=pytz.utc)  # UTC time

        # Convert to UTC (should remain unchanged)
        result = UtilityTimeZone.convert_datetime_to_utc(utc_datetime)

        self.assertEqual(result, utc_datetime)

    def test_day_start_datetime_utc_dst(self):
        # Test for a date during Daylight Saving Time (DST)
        date_str = "2024-06-15"  # Date during DST in America/Montreal
        expected_format = "%Y-%m-%d"

        # Expected datetime localized to the user's timezone
        expected_local = pytz.timezone("America/Montreal").localize(datetime.strptime(date_str, expected_format))
        expected_local_start = expected_local.replace(hour=0, minute=0, second=0, microsecond=0)

        # Convert to UTC for the expected result
        expected_utc = expected_local_start.astimezone(pytz.utc)

        # Call the function
        result = UtilityTimeZone.get_day_start_datetime_utc(date_str)

        # Assert that the result matches the expected UTC datetime (accounting for DST)
        self.assertEqual(result, expected_utc)

    def test_day_start_datetime_utc_standard_time(self):
        # Test for a date during standard time (no DST)
        date_str = "2024-12-01"  # Date during standard time
        expected_format = "%Y-%m-%d"

        # Expected datetime localized to the user's timezone
        expected_local = pytz.timezone("America/Montreal").localize(datetime.strptime(date_str, expected_format))
        expected_local_start = expected_local.replace(hour=0, minute=0, second=0, microsecond=0)

        # Convert to UTC for the expected result
        expected_utc = expected_local_start.astimezone(pytz.utc)

        # Call the function
        result = UtilityTimeZone.get_day_start_datetime_utc(date_str)

        # Assert that the result matches the expected UTC datetime (accounting for standard time)
        self.assertEqual(result, expected_utc)

    def test_day_start_invalid_date_format(self):
        # Test for an invalid date format
        invalid_date_str = "19-10-2024"  # Invalid format

        with self.assertRaises(ValueError):
            UtilityTimeZone.get_day_start_datetime_utc(invalid_date_str)

    def test_day_end_datetime_utc_dst(self):
        # Test for a date during Daylight Saving Time (DST)
        date_str = "2024-06-15"  # Date during DST in America/Montreal
        expected_format = "%Y-%m-%d"

        # Expected datetime localized to the user's timezone
        expected_local = pytz.timezone("America/Montreal").localize(datetime.strptime(date_str, expected_format))
        expected_local_end = expected_local.replace(hour=23, minute=59, second=59, microsecond=999999)

        # Convert to UTC for the expected result
        expected_utc = expected_local_end.astimezone(pytz.utc)

        # Call the function
        result = UtilityTimeZone.get_day_end_datetime_utc(date_str)

        # Assert that the result matches the expected UTC datetime (accounting for DST)
        self.assertEqual(result, expected_utc)

    def test_day_end_datetime_utc_standard_time(self):
        # Test for a date during standard time (no DST)
        date_str = "2024-12-01"  # Date during standard time
        expected_format = "%Y-%m-%d"

        # Expected datetime localized to the user's timezone
        expected_local = pytz.timezone("America/Montreal").localize(datetime.strptime(date_str, expected_format))
        expected_local_end = expected_local.replace(hour=23, minute=59, second=59, microsecond=999999)

        # Convert to UTC for the expected result
        expected_utc = expected_local_end.astimezone(pytz.utc)

        # Call the function
        result = UtilityTimeZone.get_day_end_datetime_utc(date_str)

        # Assert that the result matches the expected UTC datetime (accounting for standard time)
        self.assertEqual(result, expected_utc)

    def test_day_end_invalid_date_format(self):
        # Test for an invalid date format
        invalid_date_str = "19-10-2024"  # Invalid format

        with self.assertRaises(ValueError):
            UtilityTimeZone.get_day_end_datetime_utc(invalid_date_str)

    def tearDown(self):
        del self.utility_time_zone
