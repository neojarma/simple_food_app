import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_food_app/app/core/theme.dart';

import '../controllers/order_controller.dart';

class UserInformation extends GetView<OrderController> {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  static final textFieldWidth = Get.width * 0.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date : ${controller.currentDate}',
              style: userInformationTextStyle),
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Customer Name : ',
                  style: userInformationTextStyle,
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: textFieldWidth,
                  child: TextField(
                    autofocus: true,
                    controller: controller.nameController,
                    maxLength: 100,
                    style: userInformationTextStyle,
                    decoration: InputDecoration(
                      isDense: true,
                      counterText: '',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
