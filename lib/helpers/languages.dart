class Languages {
  final int id;
  final String name;
  final String CountryCode;

  Languages({required this.id, required this.name, required this.CountryCode});
}

List<Languages> country = [
  Languages(id: 1, name: "Amharic", CountryCode: "am"),
  Languages(id: 2, name: "English", CountryCode: "en"),
];
