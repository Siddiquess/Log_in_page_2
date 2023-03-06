// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

// ========== Sized Box One =========== //
const List kart_images = [
  "images/man1.webp",
  "images/shoe.webp",
  "images/tablet.webp",
  "images/girl.webp",
  "images/realme_air.webp",
  "images/camara.webp",
  "images/man2.webp",
  "images/trimmer.webp",
  
];
List cardHeadingOne = [
  "Allen Solly, Louis Phil..",
  "Kids's Shoes, Sandle",
  "Premium Tablets",
   "Girl's Dresses",
  "Best of Headphones",
  "Best Selling Camara",
  "Nike,ADIDAS, ..",
   "Best of Trimmers",
  
];
List offersOne = [
  '55-70% off',
  "Min . 50% off",
  'From ₹24,999',
   "Min . 70% off",
  'Buy Now',
  "From ₹6499",
  "50-80% off",
  "From ₹399",
  
];
List listTileOne = [
  "Casual Shirts,Trousers..",
  "Puma,  Red Tape...",
  "By Samsung",
   "For your Li'l Princess",
  'boAt, realme, Sony',
  "Canon,SONY & more",
  "Shorts,Trackpants,Tra...",
  "Philips, Mi & more",
];


class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return (GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 304,),
        itemBuilder: (context, index) {
          return Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(children: [
              Image.asset(
                kart_images[index],
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      cardHeadingOne[index],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      offersOne[index],
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    Text(
                      listTileOne[index],
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              )
            ]),
          );
        },
        itemCount: kart_images.length));
  }
}


