class StoreApplication {
  String scoreText;
  double score;
  String title;
  String appId;
  String url;
  String icon;
  String developer;
  String currency;
  double price;
  bool free;
  String summary;
  String installs;
  int maxInstalls;
  String version;
  bool isAvailable;

  StoreApplication({
    required this.appId,
    this.currency = "USD",
    required this.developer,
    required this.icon,
    this.free = true,
    this.price= 0,
    required this.summary,
    required this.url,
    this.score = 0.0,
    required this.scoreText,
    required this.title,
    required this.installs,
    required this.maxInstalls,
    required this.version,
    this.isAvailable = true
  });
}