import 'package:order_food_app/app/data/models/order_model.dart';

class FinishOrder {
  final String userPayment;
  final String change;
  final UserOrder order;

  FinishOrder(
      {required this.userPayment, required this.change, required this.order});
}
