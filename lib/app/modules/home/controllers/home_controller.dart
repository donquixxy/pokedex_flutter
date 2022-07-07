import 'package:get/get.dart';
import 'package:pokedex/app/data/pokemon_models.dart';
import 'package:pokedex/app/data/pokemon_provider.dart';

class HomeController extends GetxController {
  // var listData = List<PokemonModels>.empty(growable: true).obs;
  var listData = <PokemonModels>[].obs;

  Future<void> getData() async {
    var results = await PokemonProvider().fetchPokemonData();

    listData.value = results!;
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
