import 'package:fast_food_abc/app/data/models/calculation.dart';
import 'package:fast_food_abc/app/data/models/food_model.dart';
import 'package:fast_food_abc/app/data/models/receipt_model.dart';
import 'package:fast_food_abc/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  Map<String, dynamic> prevArgs = Get.arguments;

  late String name;
  late String date;
  late List<MenuModel> choosenItem;

  late int subtotal;
  late int totalTax;
  late int total;

  TextEditingController inputPaymentController = TextEditingController();

  @override
  void onInit() {
    initializeData();

    super.onInit();
  }

  void verifyPayment(String? value) {
    if (value == null) return;

    if (!value.isNumericOnly) return;

    var userInput = int.parse(value);
    if (userInput < total) return;

    var change = CalculationPrice.calculateChange(total, userInput);

    var arguments = Receipt(
      name: name,
      change: change,
      choosenItem: choosenItem,
      date: date,
      subtotal: subtotal,
      tax: totalTax,
      total: total,
      cash: userInput,
    );

    Get.offAllNamed(Routes.RECEIPT, arguments: arguments);
  }

  void initializeData() {
    name = prevArgs['name'];
    date = prevArgs['date'];
    choosenItem = prevArgs['items'];

    subtotal = CalculationPrice.calculateSubTotal(choosenItem);
    totalTax = CalculationPrice.calculateTax(choosenItem);
    total = CalculationPrice.calculateTotal(choosenItem);
  }
}
