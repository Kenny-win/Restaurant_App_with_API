class RestoDetailApi {
  bool error;
  String message;
  DetailRestaurants restaurant;

  RestoDetailApi({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestoDetailApi.fromJson(Map<String, dynamic> json) => RestoDetailApi(
      error: json['error'],
      message: json['message'],
      restaurant: DetailRestaurants.fromJson(json['restaurant']),
  );
}

class DetailRestaurants {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<Categories> categories;
  Menus menus;
  num rating;
  List<CustomerReviews> customerReviews;

  DetailRestaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory DetailRestaurants.fromJson(Map<String, dynamic> json)=>
  DetailRestaurants(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    city: json['city'],
    address: json['address'],
    pictureId: json['pictureId'],
    categories: List<Categories>.from(json['categories'].map((json)=> Categories.fromJson(json))),
    menus: Menus.fromJson(json['menus']),
    rating: json['rating'],
    customerReviews: List<CustomerReviews>.from(json['customerReviews'].map((json)=> CustomerReviews.fromJson(json)))
  );
}

class Categories {
  String name;

  Categories({
    required this.name,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      Categories(name: json['name']);
}

class Menus {
  List<Foods> foods;
  List<Drinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Foods>.from(
          json['foods'].map(
            (json) => Foods.fromJson(json),
          ),
        ),
        drinks: List<Drinks>.from(
          json['drinks'].map(
            (json) => Drinks.fromJson(json),
          ),
        ),
      );
}

class Foods {
  String name;

  Foods({
    required this.name,
  });

  factory Foods.fromJson(Map<String, dynamic> json) =>
      Foods(name: json['name']);
}

class Drinks {
  String name;

  Drinks({
    required this.name,
  });

  factory Drinks.fromJson(Map<String, dynamic> json) =>
      Drinks(name: json['name']);
}

class CustomerReviews {
  String name;
  String review;
  String date;

  CustomerReviews({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReviews.fromJson(Map<String, dynamic> json)=>
  CustomerReviews(
    name: json['name'],
    review: json['review'],
    date: json['date'],
  );
}
