import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:order_food_app/app/data/models/menu_model.dart';
import 'package:order_food_app/app/data/models/order_model.dart';
import 'package:order_food_app/app/routes/app_pages.dart';

class OrderController extends GetxController {
  late String currentDate;
  late TextEditingController nameController;

  var menus = listOfMenu;

  @override
  void onInit() {
    initialize();

    super.onInit();
  }

  void initialize() {
    initializeDate();

    initializeController();
  }

  @override
  void onClose() {
    // reset quantity state
    final controller = Get.find<OrderController>();
    for (var element in controller.menus) {
      element.quantity.value = 0;
    }

    super.onClose();
  }

  void inputOrder() {
    final isNameInvalid = nameController.text == '';
    if (isNameInvalid) {
      Get.snackbar('Invalid Order', 'Please input customer name');
      return;
    }

    final isNoMenuSelected =
        menus.every((element) => element.quantity.value == 0);
    if (isNoMenuSelected) {
      Get.snackbar('Invalid Order', 'Please select your menu');
      return;
    }

    // find selected menu
    final selectedMenu =
        menus.where((menu) => menu.quantity.value != 0).toList();

    final name = nameController.text;
    final userOrder = UserOrder(
      userName: name,
      currentDate: currentDate,
      userMenuOrder: selectedMenu,
    );

    Get.toNamed(Routes.REVIEW, arguments: userOrder);
  }

  void initializeController() => nameController = TextEditingController();

  void initializeDate() {
    var date = DateTime.now();
    var formatter = DateFormat('dd MMM yyyy');
    String formattedDate = formatter.format(date);
    currentDate = formattedDate;
  }
}
