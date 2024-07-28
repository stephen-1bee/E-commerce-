import 'package:flutter/material.dart';
import 'package:shop/cart.dart';
import 'package:shop/productList.dart';
import 'package:shop/test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screen = [const ProductList(), const CartScreen(), const Test()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screen),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        selectedItemColor: Colors.blueGrey,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 0 ? Icons.home_filled : Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 1
                  ? Icons.shopping_bag
                  : Icons.shopping_bag_outlined,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
