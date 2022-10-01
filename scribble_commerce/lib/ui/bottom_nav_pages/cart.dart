import 'package:flutter/material.dart';
import 'package:scribble_commerce/widgets/fetch_products.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 15.00),
        child: SafeArea(
          child: fetchData("users-cart-items"),
        ),
      ),
    );
  }
}
