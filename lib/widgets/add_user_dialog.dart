import 'package:flutter/material.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({
    super.key, required this.usernameText, required this.userIdText, required this.onTap,
  });
  final TextEditingController usernameText;
  final TextEditingController userIdText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameText,
              decoration: const InputDecoration(
                  hintText: "input username..."
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: userIdText,
              decoration: const InputDecoration(
                  hintText: "input user id..."
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: onTap,
                style:  ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                        Size(double.infinity,45)
                    ),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    )
                ),
                child: const Text("Add User"))
          ],
        ),
      ),
    );
  }
}
