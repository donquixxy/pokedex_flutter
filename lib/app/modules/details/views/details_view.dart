import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokedex/app/modules/details/widgets/detail_widgets.dart';
import 'package:pokedex/app/modules/details/widgets/evolution_widgets.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  final homeController = Get.find<HomeController>();
  //  var tabBarController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('DetailsView'),
      //   centerTitle: true,
      // ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          String colorType = controller.pokeArguments.type[0];
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.35,
                color: colorType == 'Fire'
                    ? Colors.redAccent
                    : colorType == 'Water'
                        ? Colors.lightBlueAccent.shade400
                        : colorType == 'Poison'
                            ? Colors.pinkAccent
                            : colorType == 'Electric'
                                ? Colors.yellowAccent.shade700
                                : colorType == 'Grass'
                                    ? const Color.fromARGB(255, 4, 147, 114)
                                    : colorType == 'Bug'
                                        ? Colors.deepPurpleAccent
                                        : Colors.blueGrey,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        vertical: constraints.maxHeight * 0.07,
                        horizontal: constraints.maxWidth * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.pokeArguments.name,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.pokeArguments.type.length,
                            itemBuilder: (context, dataIndex) {
                              return Chip(
                                  backgroundColor: colorType == 'Fire'
                                      ? Colors.redAccent.shade100
                                      : colorType == 'Water'
                                          ? Colors.lightBlueAccent.shade100
                                          : colorType == 'Poison'
                                              ? Colors.pinkAccent.shade100
                                              : colorType == 'Electric'
                                                  ? Colors.yellowAccent.shade200
                                                  : colorType == 'Grass'
                                                      ? const Color.fromARGB(
                                                          200, 4, 147, 114)
                                                      : colorType == 'Bug'
                                                          ? Colors
                                                              .deepPurpleAccent
                                                              .shade100
                                                          : Colors.blueGrey
                                                              .shade100,
                                  label: Text(
                                    controller.pokeArguments.type[dataIndex],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 3,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                margin: EdgeInsets.only(top: constraints.maxHeight * 0.3),
                child: Container(
                    margin: const EdgeInsets.only(top: 30, left: 12, right: 12),
                    child: Column(
                      children: [
                        TabBar(
                          physics: const NeverScrollableScrollPhysics(),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.black,
                          indicatorColor: colorType == 'Fire'
                              ? Colors.redAccent
                              : colorType == 'Water'
                                  ? Colors.lightBlueAccent.shade400
                                  : colorType == 'Poison'
                                      ? Colors.pinkAccent
                                      : colorType == 'Electric'
                                          ? Colors.yellowAccent.shade700
                                          : colorType == 'Grass'
                                              ? const Color.fromARGB(
                                                  255, 4, 147, 114)
                                              : colorType == 'Bug'
                                                  ? Colors.deepPurpleAccent
                                                  : Colors.blueGrey,
                          unselectedLabelColor: Colors.grey,
                          controller: controller.tabController,
                          tabs: controller.listTab.map((itemTab) {
                            return Text(
                              itemTab.text!,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            );
                          }).toList(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 18),
                            child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              controller: controller.tabController,
                              children: [
                                DetailWidget(),
                                EvolutionWidget(),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Positioned(
                top: 70,
                right: -30,
                child: Image.asset(
                  'assets/pokeball.png',
                  height: 140,
                ),
              ),
              Positioned(
                left: constraints.maxWidth * 0.26,
                top: constraints.maxHeight * 0.13,
                child: CachedNetworkImage(
                  imageUrl: controller.pokeArguments.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: IconButton(
                  onPressed: Get.back,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      //  Hero(
      //   tag: homeController.listData[controller.receivedIndex].id,
      //   child: Image.network(
      //       homeController.listData[controller.receivedIndex].imageUrl),
      // ),
    );
  }
}
