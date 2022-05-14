import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Fast Food ABC",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
