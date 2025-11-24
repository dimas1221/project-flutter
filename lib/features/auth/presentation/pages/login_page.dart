import 'package:flutter/material.dart';
import '../../../../app/widgets/global_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Page", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            GlobalButton(
              text: "Masuk ke Home",
              onPressed: () => Navigator.pushNamed(context, "/"),
            ),
          ],
        ),
      ),
    );
  }
}
