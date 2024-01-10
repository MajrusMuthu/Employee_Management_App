// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, use_build_context_synchronously, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:csc_picker/csc_picker.dart';
import 'package:employee_management_system/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:employee_management_system/components/Text_field.dart';
import 'package:image_picker/image_picker.dart';

class UpdateEmployeePage extends StatefulWidget {
  const UpdateEmployeePage({
    super.key,
  });

  @override
  State<UpdateEmployeePage> createState() => _UpdateEmployeePageState();
}

class _UpdateEmployeePageState extends State<UpdateEmployeePage> {
  late int selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  "Update Employee Profile",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(height: 20),
                MyTextField(
                  hindText: 'Employee ID',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hindText: 'Name',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hindText: 'Email',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
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
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        hindText: 'Address',
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        hindText: 'Phone Number',
                        obscureText: true,
                        keyboardType: TextInputType.phone,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: CSCPicker(
                          flagState: CountryFlag.ENABLE,
                          disabledDropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: Colors.grey.shade400,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            color: Colors.grey.shade400,
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
                        "Update",
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
}
