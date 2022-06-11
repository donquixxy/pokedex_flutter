import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/details/controllers/details_controller.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class EvolutionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    var detailController = Get.find<DetailsController>();
    var detailInformation = controller.listData[detailController.receivedIndex];
    var helper = controller.listData.where((p0) {
      for (var data in detailInformation.nextEvolution) {
        return data.num == p0.num;
      }
      return false;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Next Evolution',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                mainAxisExtent: 150),
            shrinkWrap: true,
            itemCount: helper.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      helper[index].imageUrl,
                      fit: BoxFit.fitWidth,
                      height: 100,
                    ),
                    Text(
                      helper[index].name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
