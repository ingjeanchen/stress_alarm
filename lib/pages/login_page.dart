import 'package:firebase_core/firebase_core.dart';
import 'package:stress_alarm/util/color.dart';
import 'package:stress_alarm/widgets/gradient_container.dart';
import 'package:stress_alarm/pages/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool validateEmail(String email) {
    // 建立email驗證用的正則表達式
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    // 驗證email是否符合正則表達式要求
    return emailRegex.hasMatch(email);
  }

  void _loginPressed() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // 驗證email格式是否正確
    if (validateEmail(email)) {
      // 在這裡實現登入邏輯
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successfully'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email format'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      title: 'login',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                style: TextStyle(color: generateMaterialColor(Palette.white)),
                decoration: InputDecoration(
                    labelText: 'Your Email',
                    labelStyle:
                        TextStyle(color: generateMaterialColor(Palette.white))),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: generateMaterialColor(Palette.white)),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: generateMaterialColor(Palette.white)),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loginPressed,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
