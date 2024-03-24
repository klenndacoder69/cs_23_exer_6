import 'package:flutter/material.dart';
import 'package:myapp/pages/cart.dart';
import 'package:myapp/pages/catalog.dart';
import 'package:myapp/pages/checkout.dart';
import 'package:myapp/providers/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ShoppingCart(), child: const RootWidget()));
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week 6: State Management",
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.blue,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      initialRoute: "/",
      routes: {
        "/": (context) => const CatalogPage(),
        "/cart": (context) => const CartPage(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}
