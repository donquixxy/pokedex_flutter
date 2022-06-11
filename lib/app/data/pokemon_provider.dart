import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokedex/app/static/static.dart';
import 'pokemon_models.dart';

class PokemonProvider extends GetConnect {
  Future<Response?> getPokemon(List<PokemonModels> data, {counter = 0}) async {
    try {
      final responseData = await get(apiUrl);
      // List<PokemonModels> listOfData = [];
      var resultData = jsonDecode(responseData.body);

      if (responseData.statusCode == 200) {
        print(resultData['pokemon']);

        for (Map<String, dynamic> pokemonData in resultData['pokemon']) {
          PokemonModels pokeData = PokemonModels.fromJson(pokemonData);

          data.add(pokeData);
        }
      } else {
        throw Exception('Failed to fetch data . . ');
      }

      return responseData;
    } on Exception catch (e) {
      if (counter < 3) {
        counter = counter + 1;
        print(e);
        return getPokemon(data, counter: counter);
      }
    } finally {
      print("succed");
    }
    return null;
  }
}
