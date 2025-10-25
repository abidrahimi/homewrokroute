import 'package:flutter/material.dart';
import 'homeauto.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  List<String> users = [];
  List<String> passwords = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(fontSize: 40)),
              SizedBox(height: 30),
              TextField(controller: user, decoration: InputDecoration(labelText: 'Username')),
              SizedBox(height: 20),
              TextField(controller: pass, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
              
                  if (users.contains(user.text) && passwords.contains(pass.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account ${user.text} already exists')));
                  } else {
                    users.add(user.text);
                    passwords.add(pass.text); 
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeAutoPage()));
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
