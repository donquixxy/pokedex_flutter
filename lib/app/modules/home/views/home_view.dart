import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
      ),
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
                            height: 30,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
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
                                      arguments: [index]);
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
                                          child: Image.network(
                                            controller.listData[index].imageUrl,
                                            // errorBuilder:
                                            //     (context, error, stackTrace) =>
                                            //         Icon(Icons.error),
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }

                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                            width: 130,
                                            fit: BoxFit.cover,
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
