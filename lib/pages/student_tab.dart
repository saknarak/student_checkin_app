import 'package:flutter/material.dart';
import 'package:student_checkin_app/store/app_store.dart';

class StudentTab extends StatefulWidget {
  StudentTab({super.key});

  @override
  State<StudentTab> createState() => _StudentTabState();
}

class _StudentTabState extends State<StudentTab> {
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
    // getStudents();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    // _getStudents();
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
          listenable: Listenable.merge([AppStore.studentsChanged, iChanged]),
          builder: (BuildContext context, Widget? child) {
            return Text('Student ${AppStore.students.length} i=$i');
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
        listenable: AppStore.studentsChanged,
        builder: (context, child) {
          print('list view');
          return ListView.builder(
            itemCount: AppStore.students.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.star),
              title: Text('Name=${AppStore.students[index]['fullname']}'),
              subtitle: Text('Code=${AppStore.students[index]['code']}'),
            ),
          );
        },
      ),
    );
  }
}
