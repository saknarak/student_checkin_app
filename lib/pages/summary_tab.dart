import 'package:flutter/material.dart';
import 'package:student_checkin_app/store/app_store.dart';

class SummaryTab extends StatelessWidget {
  const SummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: ListenableBuilder(
        builder: (context, child) {
          return Text('จำนวนนักเรียนทั้งหมด ${AppStore.students.length} คน');
        },
        listenable: AppStore.studentsChanged,
      ),
    );
  }
}
