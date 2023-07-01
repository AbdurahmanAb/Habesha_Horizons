class News {
  final title;
  final ImagePath;
  final Subtitle;
  final detail;

  News(
      {required this.title,
      required this.ImagePath,
      required this.Subtitle,
      required this.detail});
}

List<News> news = [
  News(
      ImagePath: 'assets/ethio.png',
      title: "Ethiopia",
      Subtitle: "What's happening in Ethiopia",
      detail: ""),
  News(
      ImagePath: 'assets/nejashi.png',
      title: "Nejashi",
      Subtitle: "What's happening in Tigray",
      detail: ""),
  News(
      ImagePath: 'assets/afar.jpg',
      title: "Ethiopia Far",
      Subtitle: "What's happening in Afar",
      detail: ""),
  News(
      ImagePath: 'assets/gondar.jpg',
      title: "Ethiopia",
      Subtitle: "What's happening in There",
      detail: ""),
];
