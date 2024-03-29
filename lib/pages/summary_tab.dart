import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:student_checkin_app/store/app_store.dart';

class SummaryTab extends StatelessWidget {
  const SummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Watch((context) {
        return Text(
            'จำนวนนักเรียนทั้งหมด ${AppStore.students.value.length} คน');
      }),
    );
  }
}
