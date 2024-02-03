import 'package:flutter/material.dart';
import 'package:flutter_sqflite_examle/helpers/database_helper.dart';
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

  void _init() async {
    final allUser = await DatabaseHelper().getAllUsers();
    userList.clear();
    userList.addAll(allUser);
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

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
                    onTap: () async {
                      DatabaseHelper().insertNewUser(username: usernameController.text, userId: userIdController.text);
                      final allUser = await DatabaseHelper().getAllUsers();
                      userList.clear();
                      userList.addAll(allUser);
                      setState(() {});
                    },
                    usernameText: usernameController,
                    userIdText: userIdController,
                  );
                },);
          },
          isExtended: true,
          child: const Text("Add New User"),
        ),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
        return Text(userList[index]["username"]);
      },),
    );
  }
}

