import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model_class.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('//yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": '24', "start": "0"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "3de71ded3emshf6ea8fe2f608172p1c0268jsn95c7c8a724d0",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
