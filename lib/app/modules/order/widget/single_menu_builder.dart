import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_food_app/app/core/theme.dart';

import '../controllers/order_controller.dart';

class SingleMenuBuilder extends GetView<OrderController> {
  const SingleMenuBuilder({
    Key? key,
    required this.image,
    required this.price,
    required this.quantity,
    required this.title,
    required this.addMenuFunction,
    required this.minusMenuFunction,
    required this.clearMenuFunction,
  }) : super(key: key);

  final String image;
  final String price;
  final String title;
  final String quantity;
  final VoidCallback addMenuFunction;
  final VoidCallback minusMenuFunction;
  final VoidCallback clearMenuFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: Get.width / 2,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Image.asset(image),
              menuInformation(),
              menuButton(),
            ],
          ),
        ),
      ),
    );
  }

  ListTile menuInformation() {
    return ListTile(
      // isThreeLine: true,
      title: Text(
        title,
        style: menuTitleTextStyle,
      ),
      subtitle: Text(
        'Rp. $price',
        style: menuPriceTextStyle,
      ),
    );
  }

  Row menuButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: clearMenuFunction,
          child: Icon(Icons.delete_outline),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(right: 5, bottom: 5),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black54),
          ),
          child: menuQuantityOperator(),
        ),
      ],
    );
  }

  Row menuQuantityOperator() {
    return Row(
      children: [
        GestureDetector(
          onTap: minusMenuFunction,
          child: Icon(Icons.remove),
        ),
        SizedBox(
          width: 10,
        ),
        Text(quantity),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: addMenuFunction,
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
