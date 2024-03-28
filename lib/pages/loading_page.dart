import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: FilledButton(
        onPressed: () {
          context.go('/login');
        },
        child: Text('Go to login'),
      ),
    );
  }
}
