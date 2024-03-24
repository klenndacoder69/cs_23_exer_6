import 'package:flutter/material.dart';
import 'package:myapp/providers/shoppingcart_provider.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Item Details"),
              getItems(context),
            ],
          ),
        ));
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.read<ShoppingCart>().cart;

    return products.isEmpty
        ? const Text("No items to checkout!")
        : Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(products[index].name),
                          trailing: Text(products[index].price.toString()),
                        );
                      }),
                ),
                computeCost(),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<ShoppingCart>()
                          .removeAll(); // no need to listen
                      Navigator.pushNamed(context, '/');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Payment successful!"),
                        duration: Duration(seconds: 1, milliseconds: 100),
                      ));
                    },
                    child: const Text("Pay Now!"))
              ],
            ),
          );
  }

  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total: ${cart.cartTotal}");
    });
  }
}
