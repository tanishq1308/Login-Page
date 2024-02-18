import 'package:flutter/material.dart';
import 'package:login_page/controllers/user_controller.dart';
import 'package:login_page/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(
                UserController.user?.photoURL ?? 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'
              ),
            ),
            Text(
              UserController.user?.displayName ?? ''
            ),
            ElevatedButton(
                onPressed: () async {
                  await UserController.signOut();
                  if (mounted) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const Login()
                        )
                    );
                  }
                },
                child: const Text("Logout")
            )
          ],
        ),
      )
    );
  }
}