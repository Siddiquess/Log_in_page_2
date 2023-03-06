// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myapp/home_page/home_page.dart';
import 'package:myapp/main.dart';
import 'package:myapp/myNewApp/my_new_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/kart.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "ShopKart",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.white),
                ),
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 27,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 4));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const MyNewApp())));
  }

  Future<void> checkUserLoggedIn() async {
    final sharedprfrnce = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprfrnce.getBool(Key_Name);

    if (userLoggedIn == null || userLoggedIn == false) {
      gotologin();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
    }
  }
}
