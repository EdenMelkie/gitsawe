// bahrehasab.dart
class Bahrehasab {
  // Calculation results
  int wenber1 = 0;
  int Abeqtie = 0;
  int Lelit = 0;
  int Werih = 0;
  int Mealt = 0;
  int Metqie = 0;
  int MebajaHamer = 0;
  int BMT = 0;
  int tewsakDay = 0;
  String Ilet = "";

  // Display fields
  int MeteneRabit = 0;
  int fotTewsak = 0;
  String leapYearName = "";
  String sep1 = "";
  String bmt = "";
  String nn = "";
  String ay = "";
  String dz = "";
  String hn = "";
  String st = "";
  String ta = "";
  String rc = "";
  String it = "";
  String ps = "";
  String hw = "";
  String dt = "";
  String tir = "";
  String sep17 = "";
  String meg = "";

  void reset() {
    wenber1 = 0;
    Abeqtie = 0;
    Lelit = 0;
    Werih = 0;
    Mealt = 0;
    Metqie = 0;
    MebajaHamer = 0;
    BMT = 0;
    tewsakDay = 0;
    Ilet = "";
    MeteneRabit = 0;
    fotTewsak = 0;
    leapYearName = "";
    sep1 = "";
    bmt = "";
    nn = "";
    ay = "";
    dz = "";
    hn = "";
    st = "";
    ta = "";
    rc = "";
    it = "";
    ps = "";
    hw = "";
    dt = "";
    tir = "";
    sep17 = "";
    meg = "";
  }

  void calculate(int year, int month, int date) {
    // Validate input
    if (year < 0 || month > 13 || month < 1 || date > 30 || date < 1) {
      throw Exception("Invalid input: year=$year, month=$month, date=$date");
    }

    // Main calculations
    wenber1 = _calculateWenber(year);
    Abeqtie = 11 * wenber1 % 30;
    Metqie = (Abeqtie == 0) ? 30 : (19 * wenber1 % 30);

    MeteneRabit = (year + 5500) ~/ 4;
    leapYearName = _getLeapYearName((year + 5500) % 4);
    int toSep = (MeteneRabit + year + 5500) % 7;

    sep1 = "መስከረም 1 : $Metqie${_getWeekday(0, 1, toSep)}";

    fotTewsak = (toSep + Metqie) % 7;
    String Mtday = _getWeek(fotTewsak);

    if (Metqie >= 15) {
      BMT = (30 + Metqie) % 30;
      if (BMT == 0) BMT = 30;
      bmt = "ቀኑ፡ መስከረም / $BMT / $year. ዕለቱ: $Mtday = ተውሳኩ => $tewsakDay";
    } else {
      BMT = Metqie % 30;
      bmt = "ቀኑ፡ ጥቅምት : $BMT / $year. ዕለቱ $Mtday = ተውሳኩ => $tewsakDay";
    }

    MebajaHamer = (BMT + tewsakDay) % 30;
    if (MebajaHamer == 0) MebajaHamer = 30;

    Lelit = Abeqtie + (month ~/ 2) + date;
    Werih = Lelit + 4;
    Mealt = date;
    Ilet = _getWeekday(date, month, toSep);

    tir = _getDay(21, 5, toSep);
    sep17 = _getDay(17, 1, toSep);
    meg = _getDay(29, 6, toSep);

    int mn;
    if (Metqie > 14) {
      mn = ((Metqie + fotTewsak) > 30) ? 6 : 5;
    } else {
      mn = 6;
    }

    nn = "${_addEthiopianDays(year, mn, MebajaHamer, 0)}: ሰኞ";
    ay = "${_addEthiopianDays(year, mn, MebajaHamer, 14)}: ሰኞ";
    dz = "${_addEthiopianDays(year, mn, MebajaHamer, 41)}: �ለቃ";
    hn = "${_addEthiopianDays(year, mn, MebajaHamer, 62)}: እሑድ";
    st = "${_addEthiopianDays(year, mn, MebajaHamer, 67)}: ዓርብ";
    ta = "${_addEthiopianDays(year, mn, MebajaHamer, 69)}: እሑድ";
    rc = "${_addEthiopianDays(year, mn, MebajaHamer, 93)}: ረቡዕ";
    it = "${_addEthiopianDays(year, mn, MebajaHamer, 108)}: ኀሙስ";
    ps = "${_addEthiopianDays(year, mn, MebajaHamer, 118)}: እሑድ";
    hw = "${_addEthiopianDays(year, mn, MebajaHamer, 119)}: ሰኞ";
    dt = "${_addEthiopianDays(year, mn, MebajaHamer, 121)}: ረቡዕ";
  }

  // Helper methods
  int _calculateWenber(int year) {
    int c = (year + 5500) % 532;
    if (c == 0) return 18;
    c %= 76;
    if (c == 0) return 18;
    c %= 19;
    return (c == 0) ? 18 : c - 1;
  }

  String _getWeek(int z) {
    switch (z) {
      case 1:
        tewsakDay = 5;
        return "ማግሰኞ";
      case 2:
        tewsakDay = 4;
        return "ረቡዕ";
      case 3:
        tewsakDay = 3;
        return "ኀሙስ";
      case 4:
        tewsakDay = 2;
        return "ዓርብ";
      case 5:
        tewsakDay = 8;
        return "ቀዳሚት ሰንበት";
      case 6:
        tewsakDay = 7;
        return "ሰንበተ ክርስትያን ቅድስት";
      case 0:
        tewsakDay = 6;
        return "ሰኞ";
      default:
        return "የተሳሳተ";
    }
  }

  String _getWeekday(int date, int month, int sep1) {
    int z = (date + 2 * (month - 1) + sep1) % 7;
    switch (z) {
      case 1:
        return "ማግሰኞ";
      case 2:
        return "ረቡዕ";
      case 3:
        return "ኀሙስ";
      case 4:
        return "ዓርብ";
      case 5:
        return "ቀዳሚት ሰንበት";
      case 6:
        return "ሰንበተ ክርስትያን ቅድስት";
      case 0:
        return "ሰኞ";
      default:
        return "የተሳሳተ";
    }
  }

  String _getDay(int date, int month, int sep1) {
    int z = ((date - 1) + 2 * (month - 1) + sep1) % 7;
    switch (z) {
      case 1:
        return "ማግሰኞ";
      case 2:
        return "ረቡዕ";
      case 3:
        return "ኀሙስ";
      case 4:
        return "ዓርብ";
      case 5:
        return "ቀዳሚት ሰንበት";
      case 6:
        return "ሰንበተ ክርስትያን ቅድስት";
      case 0:
        return "ሰኞ";
      default:
        return "የተሳሳተ";
    }
  }

  String _getLeapYearName(int leapYear) {
    switch (leapYear) {
      case 0:
        return "ዮሐንስ";
      case 1:
        return "ማቴዎስ";
      case 2:
        return "ማርቆስ";
      case 3:
        return "ሉቃስ";
      default:
        return "የተሳሳተ";
    }
  }

  String _addEthiopianDays(int year, int month, int day, int daysToAdd) {
    int totalDays = _calculateTotalDays(year, month, day) + daysToAdd;
    int daysInYear = _isLeapYear(year) ? 366 : 365;

    if (totalDays > daysInYear) {
      year++;
      totalDays -= daysInYear;
    } else if (totalDays <= 0) {
      year--;
      totalDays += _isLeapYear(year) ? 366 : 365;
    }

    return _convertDaysToEthiopianDate(totalDays, year);
  }

  int _calculateTotalDays(int year, int month, int day) {
    int days = (month - 1) * 30 + day;
    if (month > 12) {
      days += _isLeapYear(year) ? 6 : 5;
    }
    return days;
  }

  String _convertDaysToEthiopianDate(int totalDays, int year) {
    int month = (totalDays - 1) ~/ 30 + 1;
    int day = (totalDays - 1) % 30 + 1;

    if (month > 12) {
      month = 13;
      day = totalDays - 360;
    }

    return "$day/$month/$year";
  }

  bool _isLeapYear(int year) {
    return (year + 5500) % 4 == 3;
  }
}