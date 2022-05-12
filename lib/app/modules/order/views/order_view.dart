import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_controller.dart';
import '../widget/single_menu_builder.dart';
import '../widget/user_information.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              UserInformation(),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: listMenuBuilder(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: ElevatedButton(
          onPressed: controller.inputOrder,
          child: Text('Create Order'),
        ),
      ),
    );
  }

  List<Widget> listMenuBuilder() {
    return controller.menus
        .map(
          (menu) => Obx(
            () => SingleMenuBuilder(
              image: menu.image,
              price: menu.price.toString(),
              quantity: menu.quantity.value.toString(),
              title: menu.title,
              addMenuFunction: menu.addQuantity,
              minusMenuFunction: menu.minusQuantity,
              clearMenuFunction: menu.clearQuantity,
            ),
          ),
        )
        .toList();
  }
}
