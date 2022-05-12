import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_food_app/app/data/models/finish_order.dart';
import 'package:order_food_app/app/data/models/order_model.dart';
import 'package:order_food_app/app/routes/app_pages.dart';

import '../../../data/models/menu_model.dart';

class ReviewController extends GetxController {
  late final UserOrder userOrder;
  late final List<Menu> menu;
  late final TextEditingController userCashController;

  @override
  void onInit() {
    initialize();

    super.onInit();
  }

  void initialize() {
    userOrder = Get.arguments;
    menu = userOrder.userMenuOrder;

    userCashController = TextEditingController();
  }

  void handleUserPayment() {
    var userInputPayment = userCashController.text;
    if (userInputPayment.isEmpty) {
      invalidPayment();
      return;
    }

    var userPayment = int.tryParse(userCashController.text);
    if (userPayment == null) {
      invalidPayment();
      return;
    }

    var totalBill = userOrder.total();
    if (userPayment < totalBill) {
      invalidPayment();
      return;
    }

    var change = userPayment - totalBill;
    Get.offAllNamed(
      Routes.INVOICE,
      arguments: FinishOrder(
        userPayment: userPayment.toString(),
        change: change.toString(),
        order: userOrder,
      ),
    );
  }

  void invalidPayment() {
    Get.snackbar('Invalid Payment', 'Please input correct user payment');
    userCashController.clear();
  }
}
