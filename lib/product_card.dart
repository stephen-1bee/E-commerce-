import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Productcard extends StatelessWidget {
  final String title;
  final String image;
  final double price;

  const Productcard(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 2,
          ),
          Text('\$$price', style: GoogleFonts.nunito()),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
