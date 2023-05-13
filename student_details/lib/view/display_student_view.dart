import 'package:flutter/material.dart';

class DisplayStudentView extends StatelessWidget {
  const DisplayStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Detail',
        ),
        centerTitle: true,
        elevation: 3.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                ListTile(
                  title: const Text(
                    ('Bhesh Raj Bastola'),
                  ),
                  subtitle: const Text('Solu'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.edit),
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(Icons.delete)
                    ],
                  ),
                  isThreeLine: true,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
