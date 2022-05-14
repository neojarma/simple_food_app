import 'package:fast_food_abc/app/data/models/food_model.dart';
import 'package:fast_food_abc/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  late String date;
  late List<MenuModel> listOfMenu;

  Set category = {};

  int filteredListLength = 0;

  late List<List<MenuModel>> filteredMenu = [];

  TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    menuInitialize();

    filteredListOfMenu();

    dateInitialize();

    super.onInit();
  }

  @override
  void onClose() {
    for (var element in listOfMenu) {
      element.foodQuantity.value = 0;
    }
    super.onClose();
  }

  void handleAdd(String title) {
    final index = findIndex(title);

    listOfMenu[index].addFood();
  }

  void handleMinus(String title) {
    final index = findIndex(title);

    listOfMenu[index].delFood();
  }

  int findIndex(String title) =>
      listOfMenu.map((e) => e.title).toList().indexOf(title);

  void placeOrder() {
    // empty name
    var isTextFieldEmpty = nameController.text.isEmpty;
    if (isTextFieldEmpty) return;

    // no choosen item
    var isNoItemChoosed =
        listOfMenu.every((element) => element.foodQuantity.value == 0);
    if (isNoItemChoosed) return;

    String name = nameController.text;
    List<MenuModel> choosenItem =
        listOfMenu.where((element) => element.foodQuantity.value != 0).toList();

    var arguments = {
      "name": name,
      "date": date,
      "items": choosenItem,
    };

    Get.toNamed(Routes.PAYMENT, arguments: arguments);
  }

  void filteredListOfMenu() {
    // cek how much category in set
    int length = category.length;

    for (var i = 0; i < length; i++) {
      var filterList = listOfMenu
          .where((menu) => menu.foodCategory == category.elementAt(i))
          .toList();
      filteredMenu.add(filterList);
    }
  }

  void menuInitialize() {
    listOfMenu = defaultMenu;

    for (var menu in listOfMenu) {
      category.add(menu.foodCategory);
    }
  }

  void dateInitialize() {
    var currentDate = DateTime.now();
    var format = DateFormat('dd MMM yyyy');

    date = format.format(currentDate);
  }
}
