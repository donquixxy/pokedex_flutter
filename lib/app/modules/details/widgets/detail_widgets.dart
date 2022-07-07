import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/details/controllers/details_controller.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class DetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    var detailController = Get.find<DetailsController>();
    var detailText = detailController.pokeArguments;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBuilder('Number id', detailText.id),
          textBuilder('Height', detailText.height),
          textBuilder('Weight', detailText.weight),
          textBuilder('Candy Name', detailText.candyName),
          textBuilder('Spawn Time', detailText.spawnTime),
          textBuilder('Spawn Chance', detailText.spawnChance.toString()),
          textBuilder(
              'Weaknesses',
              detailText.weakness
                  .map((weakNess) {
                    return weakNess;
                  })
                  .toList()
                  .toString()),
        ],
      ),
    );
  }

  Widget textBuilder(String firstText, String secondText) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        children: [
          Text(
            firstText,
            style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Text(
                secondText,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
