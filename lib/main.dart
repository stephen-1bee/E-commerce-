import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/home.dart';
import 'package:shop/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
