import pytz
from datetime import datetime, timezone

from flask_login import current_user

# Define your timezone
USER_TIMEZONE = pytz.timezone('America/Montreal')
UTC = pytz.utc

FORM_INPUT_DATE_FORMAT = '%Y-%m-%dT%H:%M'


class UtilityTimeZone:
    @staticmethod
    def localize_datetime(date: datetime, user_timezone: str) -> datetime:
        # Localize the date to the user's timezone and convert to UTC
        tz = pytz.timezone(user_timezone)
        local_date = tz.localize(date)

        return local_date

    @staticmethod
    def convert_datetime_to_utc(date: datetime) -> datetime:
        if date.tzinfo is None:
            raise ValueError('Trying to convert a naive datetime to UTC')
        utc_date = date.astimezone(pytz.utc)

        return utc_date

    @staticmethod
    def convert_utc_datetime_to_timezone(date: datetime, user_timezone: str) -> datetime:
        if date.tzinfo is None or date.tzinfo != timezone.utc:
            raise ValueError('Trying to convert a non-UTC datetime to a different timezone')
        localized_date = date.astimezone(pytz.timezone(user_timezone))

        return localized_date

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
    def get_form_input_date_format():
        return FORM_INPUT_DATE_FORMAT


