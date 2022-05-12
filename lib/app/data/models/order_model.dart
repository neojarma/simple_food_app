import 'package:order_food_app/app/data/models/menu_model.dart';

class UserOrder {
  final String userName;
  final String currentDate;
  final List<Menu> userMenuOrder;

  UserOrder(
      {required this.userName,
      required this.currentDate,
      required this.userMenuOrder});

  // calculate each item
  int calculateEachItem(Menu singleMenuOrder) => singleMenuOrder.priceTotal();

  // calculate sub total
  int subTotal() {
    return userMenuOrder
        .map((singleMenuOrder) => calculateEachItem(singleMenuOrder))
        .reduce((value, element) => value + element);
  }

  // calculate tax
  int tax() => (subTotal() * 0.1).toInt();

  // calculate total
  int total() => (subTotal() + tax()).toInt();
}
