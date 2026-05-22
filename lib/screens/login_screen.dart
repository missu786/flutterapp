
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {

  final email = TextEditingController();
  final password = TextEditingController();

  Future login() async {

    var response = await http.post(
      Uri.parse('https://rholab.distrho.com/api/login'),
      body: {
        'email': email.text,
        'password': password.text
      },
    );

    var data = jsonDecode(response.body);

    if(data['status'] == true){
      Get.off(() => HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            )

          ],
        ),
      ),
    );
  }
}
