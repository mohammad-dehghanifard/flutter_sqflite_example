import 'package:flutter/material.dart';
import 'package:flutter_sqflite_examle/widgets/add_user_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  List<Map<String,dynamic>> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        centerTitle: true,
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return  AddUserDialog(
                    onTap: () {},
                    usernameText: usernameController,
                    userIdText: userIdController,
                  );
                },);
          },
          isExtended: true,
          child: const Text("Add New User"),
        ),
      ),
    );
  }
}

