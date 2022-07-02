// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

import 'package:daisy_recipe/app/data/models/recipe_model.dart';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    required this.message,
    required this.searchItems,
  });

  String message;
  List<SearchItem> searchItems;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    message: json["message"],
    searchItems: List<SearchItem>.from(json["recipes"].map((x) => SearchItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "recipes": List<dynamic>.from(searchItems.map((x) => x.toJson())),
  };
}

class SearchItem {
  SearchItem({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  int id;
  String title;
  String image;
  ImageType imageType;

  factory SearchItem.fromJson(Map<String, dynamic> json) => SearchItem(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    imageType: imageTypeValues.map[json["imageType"]] ?? ImageType.JPG,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "imageType": imageTypeValues.reverse[imageType],
  };
}

enum ImageType { JPG, PNG }

final imageTypeValues = EnumValues({
  "jpg": ImageType.JPG,
  "png": ImageType.PNG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

class SearchByIdResponse {
  String message;
  Recipe recipe;

  SearchByIdResponse({required this.message, required this.recipe});

  factory SearchByIdResponse.fromJson(Map<String, dynamic> json) {
    return SearchByIdResponse(
      message: json['message'],
      recipe: Recipe.fromJson(json['recipe'])
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "recipe": recipe.toJson(),
  };
}