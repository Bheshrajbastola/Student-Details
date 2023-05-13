import 'package:flutter/material.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();

  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set d

  //entries for city

  String? selectedCity;
  List<String> cityList = ['Bhaktpur', 'Soloukhumbu', 'Lalitpur'];

  late final List<DropdownMenuEntry<String>> _cityEntries =
      <DropdownMenuEntry<String>>[];

  final myKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    for (String city in cityList) {
      _cityEntries.add(DropdownMenuEntry(value: city, label: city));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello world'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: myKey,
            child: Column(
              children: [
                const SizedBox(height: 8),
                TextFormField(
                  controller: fnameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Bhesh Raj',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ' Please eneter fname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Bastola',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ' Please eneter lname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    hintText: '20',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ' Please eneter Age';
                    }
                    return null;
                  },
                ),
                RadioListTile(
                  title: const Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Others"),
                  value: "Others",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Balkot',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ' Please eneter Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownMenu(
                  width: 350,
                  dropdownMenuEntries: _cityEntries,
                  initialSelection: cityList[0],
                  controller: cityController,
                  label: const Text('Select your City'),
                  onSelected: (value) => {
                    setState(
                      () {
                        selectedCity = value;
                      },
                    ),
                    print(selectedCity),
                  },
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (myKey.currentState!.validate()) {}
                    },
                    child: const Text('Save Student'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/displayRoute');
                    },
                    child: const Text('Display Details'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sumRoute');
                    },
                    child: const Text('sum'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
