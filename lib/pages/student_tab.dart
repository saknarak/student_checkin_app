import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudentTab extends StatefulWidget {
  StudentTab({super.key});

  @override
  State<StudentTab> createState() => _StudentTabState();
}

class _StudentTabState extends State<StudentTab> {
  final students = [];
  final std = ChangeNotifier();
  int i = 1;
  final iChanged = ChangeNotifier();

  @override
  void initState() {
    super.initState();
    print('initState');
    // for (int i = 0; i < 100; i++) {
    //   students.add({
    //     'code': '6300$i',
    //     'fullname': 'Student $i',
    //   });
    // }
    _getStudents();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    // _getStudents();
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
          listenable: Listenable.merge([std, iChanged]),
          builder: (BuildContext context, Widget? child) {
            return Text('Student ${students.length} i=$i');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              i++;
              print('i=$i');
              iChanged.notifyListeners();
              // setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: std,
        builder: (context, child) {
          print('list view');
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.star),
              title: Text('Name=${students[index]['fullname']}'),
              subtitle: Text('Code=${students[index]['code']}'),
            ),
          );
        },
      ),
    );
  }

  _getStudents() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print('token=$token');

    final result = await http.get(
      Uri.parse('https://api.itdevclub.com/api/students'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final json = jsonDecode(result.body);
    print('student=${json['data']['students']}');

    // students.clear();
    students.addAll(json['data']['students']);
    print("students.length=${students.length}");
    std.notifyListeners();
    // setState(() {});
  }
}
