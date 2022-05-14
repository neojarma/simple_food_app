import 'food_model.dart';

abstract class CalculationPrice {
  static int calculateSubTotal(List<MenuModel> model) {
    return model
        .map((e) => e.calculatePrice())
        .reduce((value, element) => value + element);
  }

  static int calculateTax(List<MenuModel> model) {
    return (calculateSubTotal(model) * 0.1).toInt();
  }

  static int calculateTotal(List<MenuModel> model) {
    return calculateTax(model) + calculateSubTotal(model);
  }

  static int calculateChange(int total, int submittedValue) {
    return submittedValue - total;
  }
}
