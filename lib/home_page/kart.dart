// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/home_page/home_page.dart';

class KartPage extends StatelessWidget {
  const KartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'My cart',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      // ==================== Body ======================= //

      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 350,
              height: 310,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/camara.webp',
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: const [
                        Text(
                          "Best Selling Camara",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'From ₹6,499',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        Text(
                          "Canon,SONY & more",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 350,
              height: 350,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/realme_air.webp',
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: const [
                        Text(
                          "Best of Headphones",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        Text(
                          "boAt,realme,Sony",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
