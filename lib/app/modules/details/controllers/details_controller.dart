import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int receivedIndex = Get.arguments[0];
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
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: listTab.length, vsync: this);
  }
}
