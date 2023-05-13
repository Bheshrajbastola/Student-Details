import 'package:flutter/material.dart';
import 'package:student_details/view/airthemetic.dart';
import 'package:student_details/view/display_student_view.dart';
import 'package:student_details/view/student_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StudentView(),
        '/displayRoute': (context) => const DisplayStudentView(),
        '/StudentRoute': (context) => const StudentView(),
        '/sumRoute': (context) => const Airthemeticview(),
      },
    );
  }
}
