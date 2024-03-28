import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userCtrl = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: userCtrl,
            decoration: InputDecoration(
              label: Text('ชื่อผู้ใช้'),
            ),
          ),
          TextField(
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

  _doLogin(BuildContext ctx) {
    // validate
    // call api
    ctx.go('/home');
  }
}
