import 'package:flutter/material.dart';
import 'package:library_app/components/button.dart';
import 'package:library_app/components/textfield.dart';

import 'package:library_app/pages/homescreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool login = false;

  @override
  void initState() {
    super.initState();
    loadDefaultValues();
    setState(() {
      login = false;
    });
  }

  Future<void> loadDefaultValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", "user");
    await prefs.setString("password", "123");
  }

  Future<void> authenticate(String user, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user == prefs.getString("username") &&
        pass == prefs.getString("password")) {
      print("success");
      setState(() {
        login = true;
      });
    } else {
      print("wrong credential");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(40, 62, 80, 2), Colors.white70])),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Hello again!
                  Image.asset(
                    'lib/images/Welcome.png',
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: usernameController,
                    hintText: "Email",
                    obscureText: false,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),

                  //sign in button
                  CustomButton(
                    logic: onPressLogic,
                    buttonText: "Login",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //not a member? register now
                  Text(
                    "Not a member? Join us",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  CustomButton(
                    logic: () {},
                    buttonText: "Register",
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future<void> onPressLogic() async {
    print("button working");
    String username = usernameController.text;
    String password = passwordController.text;
    await authenticate(username, password);
    print(login);
    if (login == true) {
      print("logged in");
      //need to fix this
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Homescreen(
                    username: username,
                  )));
    } else {
      final snackBar =
          SnackBar(content: const Text('Username or Password is wrong!'));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
