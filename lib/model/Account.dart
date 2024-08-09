

class Account {
  String uid;
  String name;
  String image;
  String loginWith;
  DateTime createdAt;

  Account({
    required this.createdAt,
    required this.image,
    required this.loginWith,
    required this.name,
    required this.uid
  });
}