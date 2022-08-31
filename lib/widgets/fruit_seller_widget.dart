import 'package:flutter/material.dart';

import 'package:intern_task/models/fruit_info_model.dart';
import 'package:intern_task/utils/dimensions.dart';
import 'package:intern_task/utils/util.dart';

class FruitSellerWidget extends StatelessWidget {
  const FruitSellerWidget({
    Key? key,
    required this.fruitInfo,
  }) : super(key: key);
  final FruitInfo fruitInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: hexToColor("f4f4dd"),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: getSize(context).width,
            color: Colors.white,
            child: Text(
              "${fruitInfo.seller}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fruitInfo.product ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Product")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fruitInfo.variety ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Variety")
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: hexToColor(
                      "e3e3ce",
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "\$${fruitInfo.price.toString()}",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "${fruitInfo.avgWeight.toString()}gms",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text("avg weight")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${fruitInfo.perBox.toString()}kg",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text("per Box")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      fruitInfo.boxes.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text("Boxes")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      fruitInfo.delivery.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text("Delievery")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
