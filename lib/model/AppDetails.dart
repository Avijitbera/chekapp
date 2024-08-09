
class AppDetails {
  String title;
  String description;
  String summary;
  String installs;
  int maxInstalls;
  int minInstalls;
  double score;
  String scoreText;
  int ratings;
  int reviews;
  Map<String, dynamic>? histogram;
  double price;
  bool free;
  String currency;
  String priceText;
  bool available;
  bool offersIAP;
  String? IAPRange;
  String androidVersion;
  String developer;
  String? developerWebSite;
  String? developerEmail;
  String? developerAddress;
  String privacyPolicy;
  String genre;
  List<Category> category;
  String icon;
  String headerImage;
  List<String> screenshots = [];
  bool adSupported;
  String released;
  int updated;
  String? recentChanges;
  String url;
  String appId;

  AppDetails({
     this.adSupported = true,
     required this.androidVersion,
     this.IAPRange,
     required this.appId,
     this.available = true,
     this.developerAddress,
     required this.category,
     required this.currency,
     required this.description,
     required this.developer,
     this.developerEmail,
     this.developerWebSite,
     required this.genre,
     this.free = true,
     required this.headerImage,
     required this.icon,
     this.histogram,
     required this.installs,
     required this.maxInstalls,
     required this.minInstalls,
     required this.price,
     this.offersIAP = true,
     required this.priceText,
     required this.privacyPolicy,
     required this.ratings,
     this.recentChanges,
     required this.released,
     required this.reviews,
     required this.score,
     required this.scoreText,
     required this.screenshots,
     required this.summary,
     required this.title,
     required this.updated,
     required this.url
  });

}

class Category {
  String name;
  String id;

  Category(this.id, this.name);
}