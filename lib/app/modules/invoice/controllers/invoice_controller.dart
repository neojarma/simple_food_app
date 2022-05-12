import 'package:get/get.dart';
import 'package:order_food_app/app/data/models/finish_order.dart';

class InvoiceController extends GetxController {
  late final FinishOrder finishOrder;

  @override
  void onInit() {
    finishOrder = Get.arguments;

    super.onInit();
  }
}
