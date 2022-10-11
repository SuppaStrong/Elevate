// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<ProductModel> productModelsFromJson(String str) =>
    List<ProductModel>.from(
        json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelsToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  Category? category;
  String image;
  Rating rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: categoryValues.map![json["category"]],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse![category],
        "image": image,
        "rating": rating.toJson(),
      };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    // ignore: prefer_conditional_assignment
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
































// import 'package:elevate_ecommerce/models/rate/rate_model.dart';
// import 'package:elevate_ecommerce/shared/type_json_define.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'product_model.g.dart';
// part 'product_model.freezed.dart';

// @freezed
// class ProductModel with _$ProductModel{
//   const factory ProductModel({
//     required int id,
//     required String title,
//     required double price,
//     required String image,
//     String? description,
//     RateModel? rateModel, 

//   }) = _ProductModel;
//   factory ProductModel.fromJson(JSON json) => _$ProductModelFromJson(json);
// }