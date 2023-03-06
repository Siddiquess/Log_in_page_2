// ignore_for_file: file_names, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/home_page/item_details.dart';
import 'package:myapp/home_page/kart.dart';
import 'package:myapp/myNewApp/my_new_app.dart';

//  ============== Drawer Properties ================ //

List drawerText = [
  "Profile",
  "My cart",
  "My Notifications",
  "All Categories",
  "Settings",
];

List drawerIcons = [
  Icon(Icons.person),
  Icon(Icons.shopping_cart),
  Icon(Icons.notifications),
  Icon(Icons.category),
  Icon(Icons.logout),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ============== AppBar ====================//
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(0, 250, 160, 0)),
          backgroundColor: Colors.amber[700],
          // ===== Center ===== //
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "ShopKart",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            ],
          ),
          centerTitle: true,
          // ==== Right ==== //
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const KartPage())));
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
          ],
        ),
        //  ================ Drawer ================ //
        drawer: Drawer(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    leading: drawerIcons[index],
                    iconColor: Colors.black,
                    title: index == 4
                        ? TextButton(
                            onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyNewApp(),
                                ),
                                (route) => false),
                           child: Text('Log out'),
                          )
                        : Text(
                            drawerText[index],
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ));
              },
              itemCount: 5),
        ),

// ===================  Body =================== //
        body: ItemDetails());
  }
}
