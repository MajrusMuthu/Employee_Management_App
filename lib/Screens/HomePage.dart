// ignore_for_file: avoid_print

import 'package:employee_management_system/Screens/EmployeeAdd.dart';
import 'package:employee_management_system/Screens/LoginPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Employee Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmployeeAdd(),
                  ),
                );
                print("Add Employee menu is selected.");
              } else if (value == 1) {
                print("Search menu is selected.");
              } else if (value == 2) {
                print("Settings is selected.");
              } else if (value == 3) {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
                print("Logout menu is selected.");
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                  value: 0,
                  child: Text(
                    "Add Employee",
                    style: TextStyle(color: Colors.white),
                  )),
              const PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  )),
              const PopupMenuItem(
                  value: 2,
                  child: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white),
                  )),
              const PopupMenuItem(
                  value: 3,
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 50,
        tooltip: 'Add',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmployeeAdd()),
          );
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(side: BorderSide(color: Colors.white)),
        child: const Icon(
          Icons.add_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: null,
    );
  }
}
