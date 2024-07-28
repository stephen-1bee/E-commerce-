import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 0;

  void handleAddToCart() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': widget.product['sizes'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product added successfully")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select a size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.product['imageUrl'] as String),
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Color.fromARGB(245, 236, 236, 236),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${widget.product['price']}',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List).length,
                      itemBuilder: (context, index) {
                        final sizes = (widget.product['sizes'] as List)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = sizes;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedSize == sizes
                                  ? Colors.blueGrey
                                  : null,
                              label: Text(
                                sizes.toString(),
                                style: GoogleFonts.nunito(
                                  color: selectedSize == sizes
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 13),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    onPressed: handleAddToCart,
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
