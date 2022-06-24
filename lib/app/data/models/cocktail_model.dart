class Cocktail {
  String message;
  List<Drink> drinks;

  Cocktail({
    required this.message,
    required this.drinks
});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      message: json['message'],
      drinks: List<Drink>.from(json['drinks'].map((e) => Drink.fromJson(e)))
    );
  }
}

class Drink {
  String idDrink;
  String strDrink;
  String? strDrinkAlternate;
  String? strTags;
  String? strVideo;
  String? strCategory;
  String? strIBA;
  String? strGlass;
  String? strInstructions;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Drink({
    required this.idDrink,
    required this.strDrink,
    this.dateModified,
    this.strCategory,
    this.strCreativeCommonsConfirmed,
    this.strDrinkAlternate,
    this.strDrinkThumb,
    this.strGlass,
    this.strIBA,
    this.strImageAttribution,
    this.strImageSource,
    this.strIngredient12,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strInstructions,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strTags,
    this.strVideo
});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strCategory: json['strCategory'],
      strGlass: json['strGlass'],
      strDrinkThumb: json['strDrinkThumb'],
      strInstructions: json['strInstructions'],
      strIngredient1: json['strIngredient1'],
      strIngredient2: json['strIngredient2'],
      strIngredient3: json['strIngredient3'],
      strIngredient4: json['strIngredient4'],
      strIngredient5: json['strIngredient5'],
      strIngredient6: json['strIngredient6'],
      strIngredient7: json['strIngredient7'],
      strIngredient8: json['strIngredient8'],
      strIngredient9: json['strIngredient9'],
      strIngredient10: json['strIngredient10'],
      strIngredient11: json['strIngredient11'],
      strIngredient12: json['strIngredient12'],
      strIngredient13: json['strIngredient13'],
      strIngredient14: json['strIngredient14'],
      strIngredient15: json['strIngredient15'],
    );
  }
}