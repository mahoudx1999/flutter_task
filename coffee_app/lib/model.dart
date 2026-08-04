import 'package:flutter/material.dart';

class Drink {
  final String image;
  final String name;
  final String addition;
  final String description;
  final double price;
  final String firstIngredient;
  final IconData firstIngredientIcon;
  final String secondIngredient;
  final IconData secondIngredientIcon;

  Drink({
    required this.image,
    required this.name,
    required this.addition,
    required this.description,
    required this.price,
    required this.firstIngredient,
    required this.firstIngredientIcon,
    required this.secondIngredient,
    required this.secondIngredientIcon,
  });
}

List<Drink> DrinkList = [
  Drink(
    image: "assets/Americano.jpg",
    name: "Americano",
    addition: "With Hot Water",
    description:
        "Hot water poured over a double espresso shot. Smooth and balanced, with all the bold flavor of espresso in an easier-to-sip format.",
    price: 3.50,
    firstIngredient: "Coffee",
    firstIngredientIcon: Icons.coffee,
    secondIngredient: "Water",
    secondIngredientIcon: Icons.water_drop,
  ),
  Drink(
    image: "assets/Cappuccino.avif",
    name: "Cappuccino",
    addition: "With Steamed Milk",
    description:
        "Equal parts espresso, steamed milk, and airy foam. Creamy, warm, and perfectly balanced from the first sip to the last.",
    price: 4.00,
    firstIngredient: "Coffee",
    firstIngredientIcon: Icons.coffee,
    secondIngredient: "Milk",
    secondIngredientIcon: Icons.water_drop,
  ),
  Drink(
    image: "assets/Caramel Macchiato.jpg",
    name: "Caramel Macchiato",
    addition: "With Caramel Syrup",
    description:
        "Steamed milk and vanilla syrup, marked with a fresh espresso shot and finished with a rich caramel drizzle.",
    price: 4.80,
    firstIngredient: "Coffee",
    firstIngredientIcon: Icons.coffee,
    secondIngredient: "Caramel",
    secondIngredientIcon: Icons.fastfood,
  ),
  Drink(
    image: "assets/Hot Chocolate.jpg",
    name: "Hot Chocolate",
    addition: "With Whipped Cream",
    description:
        "Premium cocoa melted into steaming whole milk, topped with a cloud of fresh whipped cream. Rich and comforting.",
    price: 4.20,
    firstIngredient: "Chocolate",
    firstIngredientIcon: Icons.cookie,
    secondIngredient: "Milk",
    secondIngredientIcon: Icons.water_drop,
  ),
  Drink(
    image: "assets/Black Tea.jpg",
    name: "Black Tea",
    addition: "With Honey",
    description:
        "Full-bodied black tea steeped to a deep amber color, lightly sweetened with honey. Bold, malty, and comforting.",
    price: 3.00,
    firstIngredient: "Tea",
    firstIngredientIcon: Icons.emoji_food_beverage,
    secondIngredient: "Honey",
    secondIngredientIcon: Icons.water_drop,
  ),
  Drink(
    image: "assets/Mocha.jpg",
    name: "Mocha",
    addition: "With Chocolate Syrup",
    description:
        "Dark espresso, steamed milk, and rich chocolate sauce, finished with a dust of cocoa powder on top.",
    price: 4.50,
    firstIngredient: "Coffee",
    firstIngredientIcon: Icons.coffee,
    secondIngredient: "Chocolate",
    secondIngredientIcon: Icons.cookie,
  ),
  Drink(
    image: "assets/Turkish Coffee.jpg",
    name: "Turkish Coffee",
    addition: "With Cardamom",
    description:
        "Fine coffee grounds boiled in a copper pot, infused with cardamom. Strong, unfiltered, with a thick layer of foam.",
    price: 3.80,
    firstIngredient: "Coffee",
    firstIngredientIcon: Icons.coffee,
    secondIngredient: "Spice",
    secondIngredientIcon: Icons.grass,
  ),
];
