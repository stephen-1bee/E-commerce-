import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<CartProvider>(context).cart);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cartItem['imageUrl'].toString(),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Delete Product",
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            content: Text(
                              "Are you sure you want to delete this Product",
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                fontSize: 17,
                              )),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .removeCart(cartItem);

                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Yes",
                                    style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  iconSize: 20,
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                subtitle: Text('Size ${cartItem['sizes']}'),
              );
            }));
  }
}
