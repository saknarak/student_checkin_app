import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:student_checkin_app/store/app_store.dart';

class StudentTab extends StatefulWidget {
  StudentTab({super.key});

  @override
  State<StudentTab> createState() => _StudentTabState();
}

class _StudentTabState extends State<StudentTab> {
  final i = signal(1);

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
    // getStudents();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    // _getStudents();
    return Scaffold(
      appBar: AppBar(
        title: Watch((BuildContext context) {
          return Text('Student ${AppStore.students.value.length} i=${i.value}');
        }),
        actions: [
          IconButton(
            onPressed: () {
              i.value++;
              print('i=${i.value}');
              // setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Watch(
        (context) {
          print('list view');
          return ListView.builder(
            itemCount: AppStore.students.value.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.star),
              title: Text('Name=${AppStore.students.value[index]['fullname']}'),
              subtitle: Text('Code=${AppStore.students.value[index]['code']}'),
            ),
          );
        },
      ),
    );
  }
}
