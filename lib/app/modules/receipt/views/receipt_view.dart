import 'package:dotted_line/dotted_line.dart';
import 'package:fast_food_abc/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/receipt_controller.dart';

class ReceiptView extends GetView<ReceiptController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff30334F),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color(0xff30334F),
        title: Text(
          'RECEIPT',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          children: [
            header(),
            SizedBox(
              height: 20,
            ),
            DottedLine(),
            Padding(
              padding: EdgeInsets.all(15),
              child: billInformation(),
            ),
            DottedLine(),
            Center(
                child: Text(
              'TAKE-AWAY',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            ...order(),
            DottedLine(),
            priceInformation(),
            userInputInformation(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAndToNamed(Routes.HOME);
        },
        child: Icon(Icons.home_filled),
      ),
    );
  }

  Column userInputInformation() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Cash'), Text(controller.receipt.cash.toString())],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Change'),
              Text(controller.receipt.change.toString())
            ],
          ),
        ),
        DottedLine(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column priceInformation() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal'),
              Text(controller.receipt.subtotal.toString())
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Tax'), Text(controller.receipt.tax.toString())],
          ),
        ),
        DottedLine(),
        ListTile(
          title: Text('Total'),
          trailing: Text(controller.receipt.total.toString()),
        ),
        DottedLine(),
      ],
    );
  }

  List<Widget> order() {
    return controller.receipt.choosenItem
        .map((e) => ListTile(
              title: Text(e.title),
              leading: Text(e.foodQuantity.value.toString()),
              subtitle: Text('price : ${e.foodPrice}'),
              trailing: Text('${e.calculatePrice()}'),
            ))
        .toList();
  }

  Column billInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Date'),
            Text(controller.receipt.date),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bill Name'),
            Text(controller.receipt.name),
          ],
        ),
      ],
    );
  }

  Column header() {
    return Column(
      children: [
        Text(
          'ABC Fast Food',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(
          'Jl. Pahlawan No 11',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Surabaya',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
