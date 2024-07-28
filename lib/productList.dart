import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/db.dart';
import 'package:shop/productDetail.dart';
import 'package:shop/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final filters = const ["All", "Nike", "Addidas", "Bata", "Alison"];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(119, 119, 119, 1),
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(119, 119, 119, 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                          side: const BorderSide(
                              color: Color.fromARGB(245, 238, 240, 235)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: selectedFilter == filter
                              ? Colors.blueGrey
                              : const Color.fromARGB(245, 247, 249, 245),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          label: Text(
                            filter,
                            style: GoogleFonts.nunito(
                                color: selectedFilter == filter
                                    ? Colors.white
                                    : Colors.black,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                          )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsScreen(product: product);
                            },
                          ),
                        );
                      },
                      child: Productcard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
