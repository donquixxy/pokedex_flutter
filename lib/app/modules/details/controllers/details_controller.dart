import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/pokemon_models.dart';

class DetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PokemonModels pokeArguments = Get.arguments[0];
  var currentIndex = 0.obs;

  final List<Tab> listTab = <Tab>[
    const Tab(
      text: 'Detail',
    ),
    const Tab(
      text: 'Evolution',
    )
  ];

  late TabController tabController;

  void changeIndex(int newValue) {
    currentIndex.value = newValue;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: listTab.length, vsync: this);
  }

  // bool fetchImageBasedOnNum(String num, PokemonModels models) {
  //   if (num == models.num) {
  //     return true;
  //   } else
  //     return false;
  // }
}
