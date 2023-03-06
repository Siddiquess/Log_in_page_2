// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/home_page/home_page.dart';
import 'package:myapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logIn_signup/signUp.dart';

class MyNewApp extends StatefulWidget {
  const MyNewApp({super.key});

  @override
  State<MyNewApp> createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {
  // ================= Variables =============== //
  final _nameController = TextEditingController();

  final _passworController = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// ============== AppBar ====================//

      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(0, 250, 160, 0)),
        backgroundColor: Colors.amber[700],

        // ===== Center ===== //
        leading: Icon(Icons.menu),
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
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ],
      ),
// ==============  Body  ================ //

      body: Container(
        color: Colors.white,
        child: ListView(children: [
          Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
// ============  Logo ================= //

                  const Padding(
                    padding: EdgeInsets.only(bottom: 70, top: 70),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/kart.jpg'),
                    ),
                  ),

//  ==================== Text Field 1 ==================== //

                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                    child: TextField(
                      controller: _nameController,
                      style: const TextStyle(color: Colors.blue),
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2)),
                          labelText: "User name or email",
                          labelStyle: const TextStyle(color: Colors.blue),
                          hintText: 'Enter user name or email',
                          hintStyle: const TextStyle(color: Colors.blue)),
                    ),
                  ),
                  // ========= Text Field 2 ======== //

                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 30, 35, 30),
                    child: TextField(
                      controller: _passworController,
                      style: const TextStyle(color: Colors.blue),
                      cursorColor: Colors.blue,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15.5),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2)),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.blue),
                          hintText: 'Enter the password',
                          hintStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.blue,
                            ),
                          )),
                    ),
                  ),

                  // =================== Button 1 Login ===================== //

                  ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        minimumSize: MaterialStatePropertyAll(Size(320, 50)),
                        textStyle: MaterialStatePropertyAll(TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                      onPressed: () {
                        checkLogin(context);
                      },
                      child: const Text("Log In")),

                  // =============== Text Bitween Buttons ================= //

                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "Are you a new user ?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  // ============== Button 2 Create new account================ //
                  ElevatedButton(
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll(BorderSide(
                          width: 2,
                          color: Colors.blue,
                        )),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        minimumSize: MaterialStatePropertyAll(Size(320, 50)),
                        textStyle: MaterialStatePropertyAll(
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignUpPage())));
                      },
                      child: const Text("Create new account"))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

// ================ Functions ====================== //

  void checkLogin(BuildContext context) async {
    final _name = _nameController.text;
    final _password = _passworController.text;

    if (_name == 'siddique' && _password == '12345') {
      // go to home

      final _sharedprfrnc = await SharedPreferences.getInstance();
      await _sharedprfrnc.setBool(Key_Name, true);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
    } else {
      final _errorMessage = 'Incorrect Password or Username';
      // Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red[700],
          duration: const Duration(seconds: 5),
          margin: const EdgeInsets.all(20),
          content: Text(
            _errorMessage,
            style: const TextStyle(color: Colors.white, fontSize: 19),
          )));
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
