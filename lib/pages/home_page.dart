import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_checkin_app/pages/student_tab.dart';
import 'package:student_checkin_app/pages/summary_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
