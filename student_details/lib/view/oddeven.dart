import 'package:flutter/material.dart';

import '../model/oddeven.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  bool _isOdd = false;
  final _numberModel = NumberModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Odd/Even Checker'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                  hintText: 'e.g. 42',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      int number = int.parse(_numberController.text);
                      _isOdd = _numberModel.isOdd(number);
                    });
                  }
                },
                child: const Text('Check'),
              ),
              const SizedBox(height: 16.0),
              _isOdd
                  ? Text(
                      'The number ${_numberController.text} is odd',
                      style: const TextStyle(fontSize: 24.0),
                    )
                  : Text(
                      'The number ${_numberController.text} is even',
                      style: const TextStyle(fontSize: 24.0),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
