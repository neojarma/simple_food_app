import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:order_food_app/app/core/theme.dart';

import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Page'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 5, top: 10),
            child: Text(
              'Information',
              style: menuTitleTextStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: DefaultTextStyle(
              style: userInformationTextStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Customer Name : ${controller.userOrder.userName}'),
                  Text('Order Date : ${controller.userOrder.currentDate}'),
                ],
              ),
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Menu',
              style: menuTitleTextStyle,
            ),
          ),
          ...generateUserPickedMenu(),
          divider(),
          userOrderPrice(),
          divider(),
          ListTile(
            title: Text(
              'Total',
              style: menuPriceTextStyle,
            ),
            trailing: Text(
              'Rp. ${controller.userOrder.total()}',
              style: menuPriceTextStyle.copyWith(fontSize: 15),
            ),
          ),
          divider(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Input user payment',
              middleText: '',
              content: Column(
                children: [
                  paymentDialogContent(
                    'Total',
                    Text('Rp. ${controller.userOrder.total()}'),
                  ),
                  paymentDialogContent(
                    'Cash',
                    Expanded(
                      child: TextField(
                        controller: controller.userCashController,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    isUsingSpacer: true,
                  ),
                ],
              ),
              textConfirm: 'Submit',
              confirmTextColor: Colors.white,
              onConfirm: controller.handleUserPayment,
              textCancel: 'Cancel',
            );
          },
          child: Text('Submit'),
        ),
      ),
    );
  }

  Row paymentDialogContent(String title, Widget trailing,
      {bool isUsingSpacer = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        (isUsingSpacer) ? Spacer() : SizedBox.shrink(),
        trailing,
      ],
    );
  }

  ListTile userOrderPrice() {
    var style = menuPriceTextStyle.copyWith(fontSize: 15);
    return ListTile(
      subtitle: DefaultTextStyle(
        style: style,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subtotal'),
            SizedBox(
              height: 10,
            ),
            Text('PPN 10% '),
          ],
        ),
      ),
      trailing: DefaultTextStyle(
        style: style,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rp. ${controller.userOrder.subTotal()}'),
            SizedBox(
              height: 10,
            ),
            Text('Rp. ${controller.userOrder.tax()}'),
          ],
        ),
      ),
    );
  }

  Divider divider() {
    return Divider(
      color: Colors.grey,
      thickness: 1.2,
      endIndent: 10,
      indent: 10,
    );
  }

  List<ListTile> generateUserPickedMenu() {
    return controller.menu
        .map((menu) => ListTile(
              leading: Image.asset(menu.image),
              title: Text(
                menu.title,
                style: menuTitleTextStyle,
              ),
              subtitle: Text(
                '${menu.quantity.value}x     @${menu.price}',
                style: menuPriceTextStyle.copyWith(fontSize: 15),
              ),
              trailing: Text(
                'Rp. ${menu.priceTotal()}',
                style: menuPriceTextStyle.copyWith(fontSize: 15),
              ),
            ))
        .toList();
  }
}
