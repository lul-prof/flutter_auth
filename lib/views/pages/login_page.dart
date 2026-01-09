import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_system/models/auth_model.dart';
import 'package:flutter_auth_system/views/pages/home_page.dart';
import 'package:flutter_auth_system/views/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameC = TextEditingController();
  TextEditingController pass1C = TextEditingController();
  List<Auth> users = <Auth>[];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? usersString = prefs.getString('users');
    if (usersString != null) {
      final List<dynamic> usersJson = jsonDecode(usersString);
      setState(() {
        users = usersJson.map((json) => Auth.fromJson(json)).toList();
      });
    }
  }

  String _hashPassword(String password){
    final bytes=utf8.encode(password);
    final hash=sha256.convert(bytes);
    return hash.toString();
  }

  void _loginUsers() {
    if (usernameC.text.isEmpty || pass1C.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'Provide all fields',
                style: TextStyle(color: Colors.red),
              ),
            ),
            actions: [
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.check, color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    // Find user 
    final user = users.firstWhere(
      (u) => u.username == usernameC.text && u.password == _hashPassword(pass1C.text),
      orElse: () => Auth(
        id: '',
        email: '',
        username: '',
        password: '',
      ),
    );

    if (user.id.isNotEmpty) {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'Invalid username or password',
                style: TextStyle(color: Colors.red),
              ),
            ),
            actions: [
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.check, color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Divider(color: Colors.white10, height: 3),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: usernameC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hint: Text('Username'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: pass1C,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.security),
                  hint: Text('Password'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FilledButton(
              style: FilledButton.styleFrom(
                elevation: 4.0,
                side: BorderSide(color: Colors.white, width: 2.0),
                shadowColor: Colors.white54,
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: _loginUsers, 
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              autofocus: false,
              style: TextButton.styleFrom(enableFeedback: false),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameC.dispose();
    pass1C.dispose();
    super.dispose();
  }
}