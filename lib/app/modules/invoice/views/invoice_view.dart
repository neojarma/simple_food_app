import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_food_app/app/routes/app_pages.dart';

import '../../../core/theme.dart';
import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INVOICE'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              'ABC',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Jl.Buah Batu no 222 E,\n Kota Bandung, Jawa Barat, 40266, \n 082127877728',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          divider(),
          Center(
            child: Text(
              'ORDER',
              style: menuTitleTextStyle,
            ),
          ),
          divider(),
          userOrderInformation(),
          divider(),
          ...generateUserOrder(),
          divider(),
          userOrderPrice(),
          divider(),
          ListTile(
            title: Text(
              'Total',
              style: menuPriceTextStyle,
            ),
            trailing: Text(
              'Rp. ${controller.finishOrder.order.total()}',
              style: menuPriceTextStyle.copyWith(fontSize: 15),
            ),
          ),
          divider(),
          userPaymentInformation(),
          divider(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed(Routes.ORDER);
          },
          child: Text('Back To Order'),
        ),
      ),
    );
  }

  ListTile userPaymentInformation() {
    var style = menuPriceTextStyle.copyWith(fontSize: 15);
    return ListTile(
      subtitle: DefaultTextStyle(
        style: style,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cash'),
            SizedBox(
              height: 10,
            ),
            Text('Change'),
          ],
        ),
      ),
      trailing: DefaultTextStyle(
        style: style,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rp. ${controller.finishOrder.userPayment}'),
            SizedBox(
              height: 10,
            ),
            Text('Rp. ${controller.finishOrder.change}'),
          ],
        ),
      ),
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
            Text('Rp. ${controller.finishOrder.order.subTotal()}'),
            SizedBox(
              height: 10,
            ),
            Text('Rp. ${controller.finishOrder.order.tax()}'),
          ],
        ),
      ),
    );
  }

  Padding userOrderInformation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultTextStyle(
        style: menuPriceTextStyle.copyWith(fontSize: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Customer Name'),
                SizedBox(
                  height: 5,
                ),
                Text('Date'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(controller.finishOrder.order.userName),
                SizedBox(
                  height: 5,
                ),
                Text(controller.finishOrder.order.currentDate),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<ListTile> generateUserOrder() {
    return controller.finishOrder.order.userMenuOrder
        .map((menu) => ListTile(
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

  Container divider() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: Colors.grey,
        thickness: 1.2,
        endIndent: 10,
        indent: 10,
      ),
    );
  }
}
