import 'package:get/get.dart';
import 'package:order_food_app/app/core/assets.dart';

class Menu {
  Menu({required this.title, required this.price, required this.image});

  final String title;
  final int price;
  final String image;
  var quantity = 0.obs;

  void addQuantity() => quantity.value++;

  void minusQuantity() {
    if (quantity.value == 0) return;
    quantity.value--;
  }

  void clearQuantity() => quantity.value = 0;

  int priceTotal() => quantity.value * price;
}

List<Menu> listOfMenu = [
  Menu(
      title: 'Honey Garlic Chicken Rice',
      price: 35000,
      image: chickenRiceImage),
  Menu(
    title: 'Beef Burger',
    price: 30000,
    image: burgerImage,
  ),
  Menu(
    title: 'Regular Fries',
    price: 25000,
    image: friesImage,
  ),
  Menu(
    title: 'Ice Cream Cone',
    price: 10000,
    image: iceCreamImage,
  ),
  Menu(
    title: 'Flurry Oreo',
    price: 18000,
    image: flurryOreoImage,
  ),
  Menu(
    title: 'Fanta Float',
    price: 15000,
    image: fantaImage,
  ),
];
