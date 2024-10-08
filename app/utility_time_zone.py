import pytz
from datetime import datetime

# Define your timezone
USER_TIMEZONE = pytz.timezone('America/Montreal')
UTC = pytz.utc


class UtilityTimeZone:

    @staticmethod
    def convert_to_utc(local_date_str):
        # Parse the local date string (assuming format: 'YYYY-MM-DD HH:MM:SS')
        local_date = datetime.strptime(local_date_str, '%Y-%m-%d %H:%M:%S')

        # Localize the date to the user's timezone and convert to UTC
        local_date = USER_TIMEZONE.localize(local_date)
        utc_date = local_date.astimezone(pytz.utc)

        # Return the date as a string in the same format but now in UTC
        return utc_date.strftime('%Y-%m-%d %H:%M:%S')

    @staticmethod
    def get_user_timezone():
        # You can replace this with logic to get timezone from session/cookie
        return pytz.timezone('America/Montreal')

    @staticmethod
    def get_day_start_datetime_tz(date: str) -> datetime:
        expected_format = "%Y-%m-%d"
        date_time = datetime.strptime(date, expected_format)
        # Localize the naive datetime to USER_TIMEZONE
        date_time_tz = USER_TIMEZONE.localize(date_time)
        date_time_tz_start = date_time_tz.replace(hour=0, minute=0, second=0, microsecond=0)

        return date_time_tz_start

    @staticmethod
    def get_day_start_datetime_utc(date: str) -> datetime:
        expected_format = "%Y-%m-%d"
        date_time = datetime.strptime(date, expected_format)
        # Localize the naive datetime to USER_TIMEZONE
        date_time_tz = USER_TIMEZONE.localize(date_time)
        date_time_tz_start = date_time_tz.replace(hour=0, minute=0, second=0, microsecond=0)
        # Convert to UTC
        date_time_utc_start = date_time_tz_start.astimezone(UTC)

        return date_time_utc_start

    @staticmethod
    def get_day_end_datetime_tz(date: str) -> datetime:
        expected_format = "%Y-%m-%d"
        date_time = datetime.strptime(date, expected_format)
        # Localize the naive datetime to USER_TIMEZONE
        date_time_tz = USER_TIMEZONE.localize(date_time)
        date_time_tz_start = date_time_tz.replace(hour=23, minute=59, second=59, microsecond=999999)

        return date_time_tz_start

    @staticmethod
    def get_day_end_datetime_utc(date: str) -> datetime:
        expected_format = "%Y-%m-%d"
        date_time = datetime.strptime(date, expected_format)
        # Localize the naive datetime to USER_TIMEZONE
        date_time_tz = USER_TIMEZONE.localize(date_time)
        date_time_tz_start = date_time_tz.replace(hour=23, minute=59, second=59, microsecond=999999)
        # Convert to UTC
        date_time_utc_start = date_time_tz_start.astimezone(UTC)

        return date_time_utc_start

    @staticmethod
    def convert_utc_datetime_to_user_time_zone(utc_date: datetime):
        """
        Function to convert a UTC date to the user's timezone
        :param utc_date:
        :param user_timezone:
        :return:
        """
        # Set UTC timezone for the parsed date
        utc_date = pytz.utc.localize(utc_date)
        # Convert to user's timezone
        local_date = utc_date.astimezone(USER_TIMEZONE)
        return local_date.strftime('%Y-%m-%d %H:%M')
