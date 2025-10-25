import 'package:flutter/material.dart';
import 'homeauto.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List<String> savedUsernames = [];

  void loginButtonPressed(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (savedUsernames.contains(username)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$username already logged in before'),
          backgroundColor: Colors.orange,
        ),
      );
    } else {
      savedUsernames.add(username);
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeAutoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Page",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => loginButtonPressed(context),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
