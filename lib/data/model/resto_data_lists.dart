class RestoApi {
  bool error;
  String message;
  int count;
  List<Restaurants> restaurants;

  RestoApi({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestoApi.fromJson(Map<String, dynamic> json) => RestoApi(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<Restaurants>.from(
          json['restaurants'].map(
            (json) => Restaurants.fromJson(json),
          ),
        ),
      );
}

class Restaurants {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  num rating;

  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'],
      );
}
