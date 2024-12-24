import 'package:flutter/material.dart';
import 'package:home_rent_ui/ui/screens/home_screen.dart';
import 'package:home_rent_ui/ui/screens/product_screen.dart';
class HomeRent extends StatelessWidget {
  const HomeRent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
