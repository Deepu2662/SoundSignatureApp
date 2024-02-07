import 'dart:convert';

import 'package:audio_2fa/const.dart';
import 'package:audio_2fa/home.dart';
import 'package:audio_2fa/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String password = "";

  showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  save() async {
    try {
      Map<String, String> body = {
        "username": email,
        "password": password,
      };
      http.Response response =
          await http.post(Uri.parse(register_url), body: body);
      print(response.body);
      if (response.statusCode == 200) {
        showToast("Registration success");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginDemo()),
        );
      } else {
        showToast("Register fail");
      }
    } catch (e) {
      print(e);
      showToast("Register fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
        backgroundColor: Colors.blue, // Customize the app bar color
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/mobileback.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 32, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id',
                      labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      hintStyle: TextStyle(color: const Color.fromARGB(179, 0, 0, 0)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (e) {
                      setState(() {
                        email = e;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextField(
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password',
                      labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      hintStyle: TextStyle(color: const Color.fromARGB(179, 0, 0, 0)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (e) {
                      setState(() {
                        password = e;
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    save();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
