import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/modules/home/views/search_delegate.dart';
import 'package:pokedex/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Obx(
        (() => controller.listData.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: -50,
                        child: Image.asset(
                          'assets/pokeball.png',
                          width: 200,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18.0),
                        child: ListView(children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'Pokedex',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Search Pokemon'),
                            onTap: () => showSearch(
                                context: context, delegate: PokemonSearch()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent:
                                        constraints.maxHeight / 4.25,
                                    mainAxisSpacing: 7,
                                    crossAxisSpacing: 5),
                            itemCount: controller.listData.length,
                            itemBuilder: (context, index) {
                              String colorType =
                                  controller.listData[index].type[0];
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.DETAILS,
                                      arguments: [controller.listData[index]]);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Card(
                                    elevation: 2,
                                    color: colorType == 'Fire'
                                        ? Colors.redAccent
                                        : colorType == 'Water'
                                            ? Colors.lightBlueAccent.shade400
                                            : colorType == 'Poison'
                                                ? Colors.pinkAccent
                                                : colorType == 'Electric'
                                                    ? Colors
                                                        .yellowAccent.shade700
                                                    : colorType == 'Grass'
                                                        ? const Color.fromARGB(
                                                            255, 4, 147, 114)
                                                        : colorType == 'Bug'
                                                            ? Colors
                                                                .deepPurpleAccent
                                                            : Colors.blueGrey,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 10,
                                          right: -25,
                                          child: Image.asset(
                                            'assets/pokeball.png',
                                            fit: BoxFit.cover,
                                            height: 100,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: -30,
                                          width: 130,
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                .listData[index].imageUrl,
                                            width: 130,
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, _) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                        Positioned(
                                          top: 50,
                                          left: 10,
                                          child: Text(
                                            controller.listData[index].name,
                                            style: GoogleFonts.notoSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Positioned(
                                          left: 10,
                                          bottom: 30,
                                          child: Chip(
                                            backgroundColor: colorType == 'Fire'
                                                ? Colors.redAccent.shade100
                                                : colorType == 'Water'
                                                    ? Colors.lightBlueAccent
                                                        .shade100
                                                    : colorType == 'Poison'
                                                        ? Colors
                                                            .pinkAccent.shade100
                                                        : colorType ==
                                                                'Electric'
                                                            ? Colors
                                                                .yellowAccent
                                                                .shade200
                                                            : colorType ==
                                                                    'Grass'
                                                                ? const Color
                                                                        .fromARGB(
                                                                    200,
                                                                    4,
                                                                    147,
                                                                    114)
                                                                : colorType ==
                                                                        'Bug'
                                                                    ? Colors
                                                                        .deepPurpleAccent
                                                                        .shade100
                                                                    : Colors
                                                                        .blueGrey
                                                                        .shade100,
                                            label: Text(
                                              controller
                                                  .listData[index].type[0],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ]),
                      ),
                    ],
                  );
                },
              )),
      ),
    );
  }
}
