import 'package:flutter/material.dart';
import 'package:scribble_commerce/widgets/fetch_products.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 15.00),
        child: SafeArea(
          child: fetchData("users-favourite-items"),
        ),
      ),
    );
  }
}
