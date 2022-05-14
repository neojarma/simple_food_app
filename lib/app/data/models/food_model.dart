import 'package:fast_food_abc/app/data/assets/assets_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum FoodCategory {
  food,
  drink;

  @override
  String toString() => name.toUpperCase();
}

class MenuModel {
  FoodCategory foodCategory;
  String title;
  String description;
  int foodPrice;
  RxInt foodQuantity = 0.obs;
  Image foodImage;

  MenuModel(
      {required this.foodImage,
      required this.title,
      required this.description,
      required this.foodPrice,
      required this.foodCategory});

  int calculatePrice() => foodPrice * foodQuantity.value;

  void addFood() => foodQuantity.value++;

  void delFood() {
    bool isZero = foodQuantity.value == 0;
    if (isZero) return;

    foodQuantity.value--;
  }
}

List<MenuModel> defaultMenu = [
  MenuModel(
    foodImage: kBurgerImage,
    title: 'Beef Burger',
    description:
        'Roti burger, 100% daging sapi, saus tomat, acar timun, potongan bawang dan mustard.',
    foodPrice: 30000,
    foodCategory: FoodCategory.food,
  ),
  MenuModel(
    foodImage: kHoneyGarlickImage,
    title: 'Honey Garlic Chicken Rice',
    foodPrice: 35000,
    description:
        'Nasi hangat dengan topping daging ayam disajikan dengan saus honey garlic',
    foodCategory: FoodCategory.food,
  ),
  MenuModel(
    foodImage: kFriesImage,
    title: 'Regular Fries',
    description: 'Kentang goreng renyah dan gurih',
    foodPrice: 25000,
    foodCategory: FoodCategory.food,
  ),
  MenuModel(
    foodImage: kIceCreamImage,
    title: 'Ice Cream Cone',
    description: 'Es krim vanilla disajikan dengan cone renyah',
    foodPrice: 10000,
    foodCategory: FoodCategory.drink,
  ),
  MenuModel(
    foodImage: kOreoImage,
    title: 'Flurry Oreo',
    description: 'Es krim vanilla lembut dengan campuran biskuit Oreo Crumbs',
    foodPrice: 18000,
    foodCategory: FoodCategory.drink,
  ),
  MenuModel(
    description:
        'Minuman berkarbonasi dengan rasa strawberry dengan tambahan es krim vanilla',
    foodImage: kFantaImage,
    title: 'Fanta Float',
    foodPrice: 15000,
    foodCategory: FoodCategory.drink,
  ),
];
