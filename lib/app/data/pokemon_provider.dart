import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokedex/app/static/static.dart';
import 'pokemon_models.dart';

class PokemonProvider extends GetConnect {
  Future<List<PokemonModels>?> fetchPokemonData() async {
    try {
      final responseData = await get(apiUrl);
      List<PokemonModels> listPokemon = [];

      if (responseData.statusCode == 200) {
        var data = jsonDecode(responseData.body);

        for (Map<String, dynamic> pokeData in data['pokemon']) {
          PokemonModels pokemonModels = PokemonModels.fromJson(pokeData);

          listPokemon.add(pokemonModels);
        }

        return listPokemon;
      } else if (responseData.statusCode != 200) {
        return [];
      }
    } on Exception catch (_) {
      Get.defaultDialog(
        middleText: 'Failed To Fetch Data',
        textConfirm: 'Ok',
        onConfirm: () {
          Get.back();
        },
      );
    }
    return null;
  }
}
