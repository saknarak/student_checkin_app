import 'package:flutter/material.dart';

class StudentTab extends StatelessWidget {
  const StudentTab({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [];
    for (int i = 0; i < 100; i++) {
      students.add({
        'code': '6300$i',
        'name': 'Student $i',
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.star),
          title: Text('Name=${students[index]['name']}'),
          subtitle: Text('Code=${students[index]['code']}'),
        ),
      ),
    );
  }
}
