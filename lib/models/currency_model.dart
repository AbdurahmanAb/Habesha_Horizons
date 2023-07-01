class CurrencyData {
  final String x;
  final double y;
  CurrencyData(this.x, this.y);
}

dynamic GetColumn() {
  List<CurrencyData> column = <CurrencyData>[
    CurrencyData("USD", 40),
    CurrencyData("EUR", 30),
    CurrencyData("ANG", 45),
    CurrencyData("POD", 55),
    CurrencyData("ASE", 25)
  ];
  return column;
}
