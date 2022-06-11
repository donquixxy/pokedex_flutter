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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Next Evolution',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: detailInformation.nextEvolution.length,
              itemBuilder: (context, index) {
                var helper = controller.listData
                    .where((models) =>
                        models.num ==
                        detailInformation.nextEvolution[index].num)
                    .toList();
                return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemCount: helper.length,
                    itemBuilder: (context, indexOfImage) {
                      return Card(
                        child: Column(
                          children: [
                            Image.network(
                              helper[indexOfImage].imageUrl,
                              fit: BoxFit.fill,
                            ),
                            Text(helper[indexOfImage].name)
                          ],
                        ),
                      );
                    });
              }),
        )
      ],
    );
  }
}
