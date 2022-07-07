import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/pokemon_models.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';
import 'package:pokedex/app/routes/app_pages.dart';

class PokemonSearch extends SearchDelegate<PokemonModels> {
  final controller = Get.find<HomeController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            List<PokemonModels> seachList = [];
          },
          icon: Icon(Icons.search)),
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var data = controller.listData.where(
        (elementData) => elementData.name.contains(query.capitalizeFirst!));

    return ListView(
      physics: BouncingScrollPhysics(),
      children: data
          .map((e) => ListTile(
                onTap: () {
                  Get.toNamed(Routes.DETAILS, arguments: [e]);
                },
                title: Text(e.name),
              ))
          .toList(),
    );
  }
}
