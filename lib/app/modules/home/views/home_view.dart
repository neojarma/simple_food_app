import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Text(
                'ABC FAST FOOD',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 12,
              ),
              child: Text(
                controller.date,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Text(
                    'Name : ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextField(
                      controller: controller.nameController,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...eachCategoryBuilder(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'payment',
        onPressed: controller.placeOrder,
        label: Text('Place Order'),
        icon: Icon(Icons.check),
      ),
    );
  }

  Widget textCategoryBuilder(int index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Text(
          controller.category.elementAt(index).toString(),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget menuBuilder(int index) => buildMenu(index);

  List<Widget> eachCategoryBuilder() {
    List<Widget> result = [];
    for (var i = 0; i < controller.category.length; i++) {
      result.add(textCategoryBuilder(i));
      result.add(buildMenu(i));
    }

    return result;
  }

  ListView buildMenu(int fixedIndex) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.filteredMenu[fixedIndex].length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: controller.filteredMenu[fixedIndex][index].foodImage,
                  title: Text(
                    controller.filteredMenu[fixedIndex][index].title,
                  ),
                  subtitle: Text(
                      controller.filteredMenu[fixedIndex][index].description),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: Text(
                          'Rp. ${controller.filteredMenu[fixedIndex][index].foodPrice}'),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.handleMinus(
                            controller.filteredMenu[fixedIndex][index].title);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.pink,
                        child: Icon(
                          Icons.remove,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => Text(
                        controller
                            .filteredMenu[fixedIndex][index].foodQuantity.value
                            .toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.handleAdd(
                            controller.filteredMenu[fixedIndex][index].title);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
