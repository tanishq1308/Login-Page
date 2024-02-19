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
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 200,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        foregroundImage: NetworkImage(
                            UserController.user?.photoURL ?? 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'
                        ),
                        radius: 25,
                      ),
                      const Spacer(),
                      Text(
                        UserController.user?.displayName ?? '',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "(${UserController.user?.email ?? ''})",
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black
                        ),
                      ),
                    ]
                ),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Icon(Icons.logout),
                  ),
                  Text('Logout',
                    style: TextStyle(
                        fontSize: 16
                    ),),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
              onTap: () async {
                await UserController.signOut();
                if (mounted) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const Login()
                      )
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${UserController.user?.displayName ?? ''}",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black
              ),
            ),
            Text(
              "Email ID: ${UserController.user?.email ?? ''}",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
            ),
            Text(
              "Phone Number: ${UserController.user?.phoneNumber ?? '----------'}",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
            )
          ],
        )
      )
    );
  }
}