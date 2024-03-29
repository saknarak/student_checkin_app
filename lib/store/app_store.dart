import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:signals/signals.dart';

class AppStore {
  // static final students = [];
  // static final studentsChanged = ChangeNotifier();
  static final students = signal([]);

  static void getStudents() async {
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

    students.value.clear();
    students.value.addAll(json['data']['students']);
    print("students.length=${students.value.length}");
    students.value = [...students.value];
    // students.set(students.value);
    // setState(() {});
    // studentsChanged.notifyListeners();
  }
}
