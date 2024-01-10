// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, use_build_context_synchronously, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:employee_management_system/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:employee_management_system/components/Text_field.dart';
import 'package:image_picker/image_picker.dart';


class EmployeeAdd extends StatefulWidget {
  const EmployeeAdd({
    super.key,
  });

  @override
  State<EmployeeAdd> createState() => _EmployeeAddState();
}

class _EmployeeAddState extends State<EmployeeAdd> {
  late int selectedGender = 0;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Let's create an Employee Profile",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    await _pickImage();
                  },
                  child: const Text(
                    'Select Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (_image != null)
                  Image.file(
                    _image!,
                    height: 50,
                  ),
                SizedBox(height: 10),
                MyTextField(
                  hindText: 'Name',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hindText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Gender :",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.white,
                                  value: 1,
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value as int;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'Male',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.white,
                                  value: 2,
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value as int;
                                    });
                                  },
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.white,
                                  value: 3,
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value as int;
                                    });
                                  },
                                ),
                                Text(
                                  'Others',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      MyTextField(
                        hindText: 'Designation',
                        obscureText: false,
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        hindText: 'Address',
                        obscureText: false, keyboardType: TextInputType.streetAddress,
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        hindText: 'Phone Number',
                        obscureText: false, keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: CSCPicker(
                          flagState: CountryFlag.ENABLE,
                          disabledDropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: Colors.grey.shade600,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            color: Colors.grey.shade600,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          onCountryChanged: (country) {},
                          onStateChanged: (state) {},
                          onCityChanged: (city) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade600),
                      child: Text(
                        "Sumbit",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
}
