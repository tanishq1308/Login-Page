import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Future _data = Future.delayed(const Duration(seconds: 5));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 34, 48, 160),
            body: Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 200,
                  width: 300,
                )
            ),
          );
        }
        else {
          return const Login();
        }
      },
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", passwd = "";
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              color: const Color.fromARGB(255, 34, 48, 160),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login to your Account",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: SizedBox(
                      height: 55,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            enableSuggestions: true,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            cursorColor: Colors.black,
                            onTapOutside: (event) => FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration.collapsed(
                                hintText: "Email",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                              )
                            ),
                            autofillHints: const [AutofillHints.email],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: SizedBox(
                      height: 55,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
                              onTapOutside: (event) => FocusScope.of(context).unfocus(),
                              enableSuggestions: false,
                              onChanged: (text) {
                                setState(() {
                                  passwd = text;
                                });
                              },
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText ? Icons.visibility_off : Icons.visibility,
                                      color: const Color.fromARGB(255, 34, 48, 160),
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16
                                  )
                              ),
                              autofillHints: const [AutofillHints.password]
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 34, 48, 160),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 10,
                          fixedSize: Size(MediaQuery.of(context).size.width - 40.0, 55),
                          shadowColor: const Color.fromARGB(255, 34, 48, 160),
                        ),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "- Or sign in with -",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Material(
                            color: Colors.white,
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/google.png",
                              height: 50,
                              width: 90,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Image.asset(
                                "assets/logo.png",
                              height: 50,
                              width: 90,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Image.asset(
                                "assets/logo.png",
                              height: 50,
                              width: 90,
                              fit: BoxFit.contain,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUp()));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 48, 160),
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", passwd = "", confmPasswd = "";
  bool _obscureText1 = true, _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              color: const Color.fromARGB(255, 34, 48, 160),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create your Account",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: SizedBox(
                      height: 55,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            enableSuggestions: true,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            cursorColor: Colors.black,
                            onTapOutside: (event) => FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration.collapsed(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16
                                )
                            ),
                            autofillHints: const [AutofillHints.email],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: SizedBox(
                      height: 55,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
                              onTapOutside: (event) => FocusScope.of(context).unfocus(),
                              enableSuggestions: false,
                              onChanged: (text) {
                                setState(() {
                                  passwd = text;
                                });
                              },
                              obscureText: _obscureText1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText1 = !_obscureText1;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText1 ? Icons.visibility_off : Icons.visibility,
                                      color: const Color.fromARGB(255, 34, 48, 160),
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16
                                  )
                              ),
                              autofillHints: const [AutofillHints.password]
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: SizedBox(
                      height: 55,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
                              onTapOutside: (event) => FocusScope.of(context).unfocus(),
                              enableSuggestions: false,
                              onChanged: (text) {
                                setState(() {
                                  confmPasswd = text;
                                });
                              },
                              obscureText: _obscureText2,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText2 = !_obscureText2;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText2 ? Icons.visibility_off : Icons.visibility,
                                      color: const Color.fromARGB(255, 34, 48, 160),
                                    ),
                                  ),
                                  hintText: "Confirm Password",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16
                                  )
                              ),
                              autofillHints: const [AutofillHints.password]
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 34, 48, 160),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 10,
                          fixedSize: Size(MediaQuery.of(context).size.width - 40.0, 55),
                          shadowColor: const Color.fromARGB(255, 34, 48, 160),
                        ),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "- Or sign up with -",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Material(
                            color: Colors.white,
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/logo.png",
                              height: 50,
                              width: 90,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Image.asset(
                              "assets/logo.png",
                              height: 50,
                              width: 90,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Image.asset(
                              "assets/logo.png",
                              height: 50,
                              width: 90,
                              fit: BoxFit.contain,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}