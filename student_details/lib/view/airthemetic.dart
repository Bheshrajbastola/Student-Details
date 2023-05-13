import 'package:flutter/material.dart';

import '../model/sum.dart';

class Airthemeticview extends StatefulWidget {
  const Airthemeticview({super.key});

  @override
  State<Airthemeticview> createState() => _AirthemeticviewState();
}

class _AirthemeticviewState extends State<Airthemeticview> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  int result = 0;

  late Airthemetic airthemeticView;

  void add() {
    airthemeticView = Airthemetic();
    setState(() {
      result = airthemeticView.add(
        int.parse(firstController.text),
        int.parse(secondController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello world'),
      ),
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: firstController,
                decoration: InputDecoration(
                  labelText: 'enter first number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextFormField(
                controller: secondController,
                decoration: InputDecoration(
                  labelText: 'enter second number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: const Text('ADD'),
                ),
              ),
              Text(
                'sum is : $result',
                style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
