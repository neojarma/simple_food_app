import 'package:fast_food_abc/app/data/models/food_model.dart';

class Receipt {
  String name;
  String date;
  List<MenuModel> choosenItem;
  int total;
  int subtotal;
  int tax;
  int change;
  int cash;

  Receipt(
      {required this.name,
      required this.change,
      required this.choosenItem,
      required this.date,
      required this.subtotal,
      required this.tax,
      required this.total,
      required this.cash});
}
