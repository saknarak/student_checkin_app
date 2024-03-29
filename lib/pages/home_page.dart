import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_checkin_app/pages/student_tab.dart';
import 'package:student_checkin_app/pages/summary_tab.dart';
import 'package:student_checkin_app/store/app_store.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    AppStore.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: TabBarView(
          children: [
            SummaryTab(),
            StudentTab(),
          ],
        ),
        floatingActionButton: OutlinedButton(
          onPressed: () {
            context.push('/checkin');
          },
          child: Text('เช็คชื่อ'),
        ),
        bottomNavigationBar: TabBar(tabs: [
          Tab(
            child: Text('ภาพรวม'),
          ),
          Tab(
            child: Text('รายชื่อนักเรียน'),
          ),
        ]),
      ),
    );
  }
}
