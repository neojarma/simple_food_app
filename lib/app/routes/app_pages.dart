import 'package:get/get.dart';

import 'package:order_food_app/app/modules/invoice/bindings/invoice_binding.dart';
import 'package:order_food_app/app/modules/invoice/views/invoice_view.dart';
import 'package:order_food_app/app/modules/order/bindings/order_binding.dart';
import 'package:order_food_app/app/modules/order/views/order_view.dart';
import 'package:order_food_app/app/modules/review/bindings/review_binding.dart';
import 'package:order_food_app/app/modules/review/views/review_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ORDER;

  static final routes = [
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW,
      page: () => ReviewView(),
      binding: ReviewBinding(),
    ),
  ];
}
