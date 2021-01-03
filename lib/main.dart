import 'package:flutter/material.dart';
import 'package:grocery_store/grocery_home.dart';

void main() => runApp(GroceryStoreApp());

class GroceryStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: GroceryHome(),
    );
  }
}
