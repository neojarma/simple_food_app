import 'package:get/get.dart';

import 'package:fast_food_abc/app/modules/home/bindings/home_binding.dart';
import 'package:fast_food_abc/app/modules/home/views/home_view.dart';
import 'package:fast_food_abc/app/modules/payment/bindings/payment_binding.dart';
import 'package:fast_food_abc/app/modules/payment/views/payment_view.dart';
import 'package:fast_food_abc/app/modules/receipt/bindings/receipt_binding.dart';
import 'package:fast_food_abc/app/modules/receipt/views/receipt_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPT,
      page: () => ReceiptView(),
      binding: ReceiptBinding(),
    ),
  ];
}
