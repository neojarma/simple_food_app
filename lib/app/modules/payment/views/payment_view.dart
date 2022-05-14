import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: ListView(
        children: [
          Center(
            child: Hero(
              tag: 'payment',
              child: Text(
                'PAYMENT',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Date',
            ),
            trailing: Text(
              controller.date,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            title: Text('Name'),
            trailing: Text(
              controller.name,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          DottedLine(),
          ...choosenMenuBuilder(),
          SizedBox(
            height: 10,
          ),
          DottedLine(),
          ListTile(
            title: Text(
              'Total (Tax 10%) :',
            ),
            trailing: Text(
              controller.total.toString(),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 14,
              left: 14,
              bottom: 14,
            ),
            child: Row(
              children: [
                Text(
                  'Pay : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    controller: controller.inputPaymentController,
                    keyboardType: TextInputType.number,
                    onSubmitted: controller.verifyPayment,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  List<Widget> choosenMenuBuilder() {
    return controller.choosenItem
        .map(
          (e) => Card(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(12, 10, 12, 10),
            elevation: 5,
            child: ListTile(
              leading: e.foodImage,
              title: Text(e.title),
              trailing: Text(e.calculatePrice().toString()),
              subtitle: Text('${e.foodQuantity.value}x'),
            ),
          ),
        )
        .toList();
  }
}
