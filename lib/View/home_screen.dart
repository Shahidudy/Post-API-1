import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        //to get data which are available inside the url
        var data = jsonDecode(response.body.toString());

        //to get full data
        print(data);

        //to get token only
        print(data['token']);

        //to get id only
        print(data['id']);
        print("login Successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post API 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                child: Center(
                  child: Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
