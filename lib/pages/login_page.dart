import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userCtrl = TextEditingController(text: '');
  final passCtrl = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Image.asset('files/logo.png'),
          TextField(
            controller: userCtrl,
            decoration: InputDecoration(
              label: Text('ชื่อผู้ใช้'),
            ),
          ),
          TextField(
            controller: passCtrl,
            obscureText: true,
            decoration: InputDecoration(
              label: Text('รหัสผ่าน'),
            ),
          ),
          FilledButton(
            onPressed: () => _doLogin(context),
            child: Text('เข้าสู่ระบบ'),
          ),
        ],
      ),
    );
  }

  _doLogin(BuildContext ctx) async {
    // validate
    // call api
    final result = await http.post(
      Uri.parse('https://api.itdevclub.com/api/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'username': userCtrl.text,
        'password': passCtrl.text,
      }),
    );
    final json = jsonDecode(result.body);

    if (json['ok'] == 0) {
      ScaffoldMessenger.of(ctx)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('${json['error']}'),
          duration: Duration(
            seconds: 10,
          ),
        ));
      return;
    }
    // save token
    // shared_preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', json['token']);

    ctx.go('/home');
  }
}
