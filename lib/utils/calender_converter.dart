class CalendarConvertor {
  CalendarConvertor() {}

  final List<String> GCMonths = [
    "January ",
    "February",
    "March",
    "April",
    "May ",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  int GCDate = 0;
  int EthDate = 0;
  int EthYear = 0;
  void YearConvert(GCMonth, GCYear) {
    if (GCMonths.indexOf(GCMonth) <= 7 && GCMonths.indexOf(GCMonth) >= 0) {
      EthYear = GCYear - 8;
      print(EthYear);
    } else {
      print(EthYear);
      EthYear = GCYear - 7;
    }
  }
}

