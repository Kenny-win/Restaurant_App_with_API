import 'package:resto_app_with_api/data/model/resto_data_lists.dart';

class SearchData {
  bool error;
  int founded;
  List restaurants;

  SearchData({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory SearchData.fromJson(Map<String, dynamic> json)=>
  SearchData(
    error: json['error'],
    founded: json['founded'],
    restaurants: List<Restaurants>.from(json['restaurants'].map((json)=>Restaurants.fromJson(json))),
  );
}

