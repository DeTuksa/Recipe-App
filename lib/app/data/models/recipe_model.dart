// To parse this JSON data, do
//
//     final recipeResponse = recipeResponseFromJson(jsonString);

import 'dart:convert';

RecipeResponse recipeResponseFromJson(String str) => RecipeResponse.fromJson(json.decode(str));

String recipeResponseToJson(RecipeResponse data) => json.encode(data.toJson());

class RecipeResponse {
  RecipeResponse({
    required this.recipes,
  });

  List<Recipe> recipes;

  factory RecipeResponse.fromJson(Map<String, dynamic> json) => RecipeResponse(
    recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
  };
}

class Recipe {
  Recipe({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.openLicense,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });

  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  int? openLicense;
  String? image;
  String? imageType;
  String? summary;
  List<dynamic>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<dynamic>? occasions;
  String? instructions;
  List<AnalyzedInstruction>? analyzedInstructions;
  dynamic originalId;
  String? spoonacularSourceUrl;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    vegetarian: json["vegetarian"],
    vegan: json["vegan"],
    glutenFree: json["glutenFree"],
    dairyFree: json["dairyFree"],
    veryHealthy: json["veryHealthy"],
    cheap: json["cheap"],
    veryPopular: json["veryPopular"],
    sustainable: json["sustainable"],
    lowFodmap: json["lowFodmap"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    gaps: json["gaps"],
    preparationMinutes: json["preparationMinutes"],
    cookingMinutes: json["cookingMinutes"],
    aggregateLikes: json["aggregateLikes"],
    healthScore: json["healthScore"],
    creditsText: json["creditsText"],
    license: json["license"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"].toDouble(),
    extendedIngredients: List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    openLicense: json["openLicense"],
    image: json["image"],
    imageType: json["imageType"],
    summary: json["summary"],
    cuisines: List<dynamic>.from(json["cuisines"].map((x) => x)),
    dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
    diets: List<String>.from(json["diets"].map((x) => x)),
    occasions: List<dynamic>.from(json["occasions"].map((x) => x)),
    instructions: json["instructions"],
    analyzedInstructions: List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    originalId: json["originalId"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
  );

  Map<String, dynamic> toJson() => {
    "vegetarian": vegetarian,
    "vegan": vegan,
    "glutenFree": glutenFree,
    "dairyFree": dairyFree,
    "veryHealthy": veryHealthy,
    "cheap": cheap,
    "veryPopular": veryPopular,
    "sustainable": sustainable,
    "lowFodmap": lowFodmap,
    "weightWatcherSmartPoints": weightWatcherSmartPoints,
    "gaps": gaps,
    "preparationMinutes": preparationMinutes,
    "cookingMinutes": cookingMinutes,
    "aggregateLikes": aggregateLikes,
    "healthScore": healthScore,
    "creditsText": creditsText,
    "license": license,
    "sourceName": sourceName,
    "pricePerServing": pricePerServing,
    "extendedIngredients": extendedIngredients == null || extendedIngredients == [] ? [] : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
    "id": id,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
    "openLicense": openLicense,
    "image": image,
    "imageType": imageType,
    "summary": summary,
    "cuisines": cuisines == null || cuisines == [] ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
    "dishTypes": dishTypes == null ? [] : dishTypes == [] ? [] :  List<dynamic>.from(dishTypes!.map((x) => x)),
    "diets": diets == null || diets == [] ? [] : List<dynamic>.from(diets!.map((x) => x)),
    "occasions": occasions == null || occasions == [] ? [] : List<dynamic>.from(occasions!.map((x) => x)),
    "instructions": instructions,
    "analyzedInstructions": analyzedInstructions == null || analyzedInstructions == [] ? [] : List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
    "originalId": originalId,
    "spoonacularSourceUrl": spoonacularSourceUrl,
  };
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  String? name;
  List<Step>? steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
    name: json["name"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": steps == null ? null : List<dynamic>.from(steps!.map((x) => x.toJson())),
  };
}

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
  });

  int? number;
  String? step;
  List<Ent>? ingredients;
  List<Ent>? equipment;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"],
    step: json["step"],
    ingredients: List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    equipment: List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": ingredients == null ? null : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
    "equipment": equipment == null ? null : List<dynamic>.from(equipment!.map((x) => x.toJson())),
  };
}

class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  int? id;
  String? name;
  String? localizedName;
  String? image;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    id: json["id"],
    name: json["name"],
    localizedName: json["localizedName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "localizedName": localizedName,
    "image": image,
  };
}

class ExtendedIngredient {
  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    id: json["id"],
    aisle: json["aisle"],
    image: json["image"],
    consistency: json["consistency"],
    name: json["name"],
    nameClean: json["nameClean"],
    original: json["original"],
    originalName: json["originalName"],
    amount: json["amount"].toDouble(),
    unit: json["unit"],
    meta: List<String>.from(json["meta"].map((x) => x)),
    measures: Measures.fromJson(json["measures"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aisle": aisle,
    "image": image,
    "consistency": consistency,
    "name": name,
    "nameClean": nameClean,
    "original": original,
    "originalName": originalName,
    "amount": amount,
    "unit": unit,
    "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
    "measures": measures?.toJson(),
  };
}

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Metric? us;
  Metric? metric;

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us?.toJson(),
    "metric": metric?.toJson(),
  };
}

class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  double? amount;
  String? unitShort;
  String? unitLong;

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    amount: json["amount"].toDouble(),
    unitShort: json["unitShort"],
    unitLong: json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitShort": unitShort,
    "unitLong": unitLong,
  };
}
