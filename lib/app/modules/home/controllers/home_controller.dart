import 'package:get/get.dart';
import 'package:pokedex/app/data/pokemon_models.dart';
import 'package:pokedex/app/data/pokemon_provider.dart';

class HomeController extends GetxController {
  var listData = List<PokemonModels>.empty(growable: true).obs;

  Future<void> getData() async {
    await PokemonProvider().getPokemon(listData);
    print(listData.length);
  }

  @override
  void onInit() {
    getData();
    // checkBackgroundColor(listData[in].type[0])
    super.onInit();
  }

  // MaterialAccentColor checkBackgroundColor(String text) {
  //   if (text == 'Fire') {
  //     return Colors.redAccent;
  //   } else if (text == 'Grass') {
  //     return Colors.lightGreenAccent;
  //   } else if (text == 'Water') {
  //     return Colors.lightBlueAccent;
  //   } else if (text == 'Electric') {
  //     return Colors.yellowAccent;
  //   } else if (text == 'Bug') {
  //     return Colors.orangeAccent;
  //   } else if (text == 'Ground') {
  //     return Colors.limeAccent;
  //   } else if (text == 'Psychic') {
  //     return Colors.tealAccent;
  //   } else {
  //     return Colors.deepPurpleAccent;
  //   }
  // }
}
