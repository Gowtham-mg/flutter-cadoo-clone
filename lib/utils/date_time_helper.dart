class DateTimeHelper {
  static const List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String getMonthAsString(int month) {
    return months[month - 1].substring(0, 3);
  }

  static String getFullMonthAsString(int month) {
    return months[month - 1];
  }

  static String greeting(DateTime date) {
    if (date.hour < 3) {
      return 'Good noon';
    } else if (date.hour < 11) {
      return 'Good morning';
    } else if (date.hour <= 15) {
      return 'Good afternoon';
    } else if (date.hour < 19) {
      return 'Good evening';
    } else {
      return 'Good night';
    }
  }

  static String statCalendarDay(DateTime startDate, DateTime endDate) {
    Duration differenceInDate = endDate.difference(startDate);
    if (differenceInDate.inDays == 0) {
      if (differenceInDate.inHours == 0) {
        int minutes = differenceInDate.inMinutes;
        return "$minutes ${minutes == 1 ? 'minute' : 'minutes'}";
      } else {
        int hours = differenceInDate.inHours;
        return "$hours ${hours == 1 ? 'hour' : 'hours'}";
      }
    } else {
      int days = differenceInDate.inDays;
      return "$days ${days == 1 ? 'day' : 'days'}";
    }
  }

  static String statEndRegistrationDay(DateTime date) {
    final DateTime currentTime = DateTime.now();
    final Duration timeDifference = date.difference(currentTime);
    if (timeDifference.inDays == 0) {
      return 'Today';
    } else if (timeDifference.inDays < 0) {
      return 'Expired';
    } else {
      return '${getMonthAsString(date.month)} ${date.day}';
    }
  }

  static String getHistoryDate(DateTime date) {
    return '${getMonthAsString(date.month)} ${date.day}, ${date.year}';
  }

  static String currentTime(DateTime date) {
    int hour = date.hour;
    bool isAm;
    if (hour == 0) {
      hour = 12;
      isAm = true;
    } else if (hour > 12) {
      hour = 12 - hour;
      isAm = false;
    } else if (hour == 12) {
      hour = 12;
      isAm = false;
    } else {
      isAm = true;
    }
    return '$hour:${date.minute}${isAm ? 'am' : 'pm'}';
  }

  static String getContactDate(DateTime date) {
    return '${getFullMonthAsString(date.month)} ${date.day}';
  }
}
