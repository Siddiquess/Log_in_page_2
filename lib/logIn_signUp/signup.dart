// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:myapp/home_page/home_page.dart';

class SignUpPage extends StatefulWidget {
 const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // =============== Vaiables ================== //
  final _newName = TextEditingController();

  final _newEmail = TextEditingController();

  final _newPassword = TextEditingController();

  final _conPassword = TextEditingController();

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==================== Body ======================= //

      body: Container(
        color: Colors.white,
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // =========== Logo ==================== //

              const Padding(
                padding: EdgeInsets.only(bottom: 70, top: 90),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/kart.jpg'),
                ),
              ),

              // ========= Text Field 1 ======== //

              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: TextField(
                  controller: _newName,
                  style: const TextStyle(color: Colors.blue),
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2)),
                      labelText: "Your name",
                      labelStyle: const TextStyle(color: Colors.blue),
                      hintText: 'Enter your name',
                      hintStyle: const TextStyle(color: Colors.blue)),
                ),
              ),
              // ========= Text Field 2 ======== //

              Padding(
                padding: const EdgeInsets.fromLTRB(35, 30, 35, 0),
                child: TextField(
                  controller: _newEmail,
                  style: const TextStyle(color: Colors.blue),
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2)),
                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.blue),
                      hintText: 'Enter your email address',
                      hintStyle: const TextStyle(color: Colors.blue)),
                ),
              ),

              // ============= Text 3 =============== //

              Padding(
                    padding: const EdgeInsets.fromLTRB(35, 30, 35, 30),
                  
                   
                      child: TextField(
                     
                        controller: _newPassword,
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.blue,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15.5),
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
                            hintStyle: const TextStyle(color: Colors.blue,),
                            suffix: InkWell(
                                onTap:_togglePasswordView,
                                child: Icon(_isHidden?Icons.visibility_off:Icons.visibility,color: Colors.blue,),
                                )
                                ),
                      ),
                   
                  ),

              // ============ Text 4 =============== //

              Padding(
                    padding: const EdgeInsets.fromLTRB(35, 0, 35, 50),
                  
                   
                      child: TextField(
                     
                        controller: _conPassword,
                        style: const TextStyle(color: Colors.blue),
                        cursorColor: Colors.blue,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15.5),
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
                            hintStyle: const TextStyle(color: Colors.blue,),
                            suffix: InkWell(
                                onTap:_togglePasswordView,
                                child: Icon(_isHidden?Icons.visibility_off:Icons.visibility,color: Colors.blue,),
                                )
                                ),
                      ),
                   
                  ),

              // ========= Button ========== //

              ElevatedButton(
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    minimumSize: MaterialStatePropertyAll(Size(310, 50)),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                  onPressed: () {
                    userSignUp(context);
                  },
                  child: const Text("Sign In")),
            ],
          ),
        ]),
      ),
    );
  }

  void userSignUp(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _yourname = _newName.text;
    final youremail = _newEmail.text;
    final yourpassword = _newPassword.text;
    final yourconpassword = _conPassword.text;

    if (_yourname == 'siddique' &&
        youremail == "siddique@gmail.com" &&
        yourpassword == '12345' &&
        yourconpassword == '12345') {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => const HomePage())),
          (route) => false);
    } else {
      const errorMessage = 'Invalid form or password';
      // Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[700],
          content: const Text(
            errorMessage,
            style: TextStyle(color: Colors.white, fontSize: 19),
          )));
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
