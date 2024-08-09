

import 'package:checkapp/model/StoreApplication.dart';

import '../model/Account.dart';
import '../model/AppDetails.dart';

class JsonToModel {
  // JsonToModel._();
  static JsonToModel intense = JsonToModel();

  Account jsonToAccount(dynamic data){
    return Account(
      createdAt: DateTime.parse(data['createdAt']),
      image: data['image'],
      loginWith: data['loginWith'],
      name: data['name'],
      uid: data['uid']
    );
  }

  AppDetails jsonToAppDetails(dynamic data){
    return AppDetails(
      title: data['title'],
      description: data['description'],
      summary: data['summary'],
      installs: data['installs'],
      maxInstalls: data['maxInstalls'],
      minInstalls: data['minInstalls'],
      score: data['score'],
      scoreText: data['scoreText'],
      ratings: data['ratings'],
      reviews: data['reviews'],
      histogram: data['histogram'] == null ? null :  data['histogram'],
      price: (data['price'] is int) ?  (data['price'] as int).toDouble() : data['price'],
      free: data['free'],
      currency: data['currency'],
      priceText: data['priceText'],
      available: data['available'],
      offersIAP: data['offersIAP'],
      IAPRange: data['IAPRange'],
      androidVersion: data['androidVersion'],
      developer: data['developer'],
      developerWebSite: data['developerWebsite'],
      developerEmail: data['developerEmail'],
      developerAddress: data['developerAddress'],
      privacyPolicy: data['privacyPolicy'],
      genre: data['genre'],
      category: (data['categories'] as List<dynamic>).map((e) {
        return Category(e['id'], e['name']);
      }).toList(),
      icon: data['icon'],
      headerImage: data['headerImage'],
      screenshots: (data['screenshots'] as List<dynamic>).map((e) => e.toString()).toList(),
      adSupported: data['adSupported'],
      released: data['released'],
      appId: data['appId'],
      updated: data['updated'] ?? 0,
      url: data['url'],
      recentChanges: data['recentChanges']


    );
  }

  List<StoreApplication> jsonToStoreApplication(dynamic data){
    List<StoreApplication> list = [];
    for (var item in data){
      list.add(StoreApplication(appId: item['appId'],
       developer: item['developer'], 
       icon: item['icon'],
       summary: item['summary'],
       url: item['url'],
       scoreText: item['scoreText'],
       title: item['title'],
       currency: item['currency'],
       free: item['free'],
       price: item['price'] is int ? (item['price']).toDouble() : item['price'],
       score: item['score'] is int ? (item['score']).toDouble() : item['score'],
       installs: item['installs'],
       maxInstalls: item['maxInstalls'],
       version: item['version'],
       isAvailable: item['isAvailable']));
    }
    return list;
  }
}