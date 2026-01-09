import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth_system/models/auth_model.dart';
import 'package:flutter_auth_system/views/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController pass1C = TextEditingController();
  TextEditingController pass2C = TextEditingController();

  List<Auth> _users = <Auth>[];

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
        _users = usersJson.map((json) => Auth.fromJson(json)).toList();
      });
    }
  }

  Future<void> _saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String usersString = jsonEncode(
      _users.map((user) => user.toJson()).toList(),
    );
    await prefs.setString('users', usersString);
  }

  String _hashPassword(String password){
    final bytes=utf8.encode(password);
    final hash=sha256.convert(bytes);
    return hash.toString();
  }

  void _addUser() {
    if (usernameC.text.isNotEmpty && emailC.text.isNotEmpty) {
      if (pass1C.text == pass2C.text) {
        setState(() {
          _users.add(
            Auth(
              id: DateTime.now().toString(),
              email: emailC.text,
              username: usernameC.text,
              password: _hashPassword(pass2C.text),
            ),
          );
        });
        _saveUser();
        usernameC.clear();
        emailC.clear();
        pass1C.clear();
        pass2C.clear();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Center(
              child: Text(
                'Registration Successful. Proceed to login',
                style: TextStyle(
                  color: Colors.green
                ),
                ),
            ),
            actions: [
              Center(
                child: IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    },));
                  }, 
                  icon: Icon(Icons.check,color: Colors.green,)
                ),
              ),
            ],
              );
          },
        );
        
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Center(
              child: Text(
                'Password do not match',
                style: TextStyle(
                  color: Colors.red
                ),
                ),
            ),
            actions: [
              Center(
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.check,color: Colors.red,)
                ),
              ),
            ],
              );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
              'Provide all fields',
              style: TextStyle(
                color: Colors.red
              ),
              ),
              
            ),
            actions: [
              Center(
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.check,color: Colors.red,)
                ),
              ),
            ],
            );
        },
      );
    }
  }

  /*
  void verify() {
    if (usernameC.text.isEmpty ||
        emailC.text.isEmpty ||
        pass1C.text.isEmpty ||
        pass2C.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Center(child: Text('Error')),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text('Please Provide all the details'),
            ),
            actions: [
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.check),
                ),
              ),
            ],
          );
        },
      );
    } else {
      if (pass1C.text == pass2C.text) {
        /* */
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Center(child: Text('Succees')),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text('Registration Successfull'),
              ),
              actions: [
                Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.check),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Center(child: Text('Error')),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Text('Passwords do not match'),
              ),
              actions: [
                Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.check),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  */

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
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(width: 20.0),
                  Text('Registration', style: TextStyle(fontSize: 30.0)),
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
                onEditingComplete: () {
                  setState(() {});
                },
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
                onEditingComplete: () {
                  setState(() {});
                },
                controller: emailC,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hint: Text('Email Address'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                onEditingComplete: () {
                  setState(() {});
                },
                controller: pass1C,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.security),
                  hint: Text('Password'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                onEditingComplete: () {
                  setState(() {});
                },
                controller: pass2C,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.security_update_good),
                  hint: Text('Confirm Password'),
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
              onPressed: () {
                _addUser();
              },
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              autofocus: false,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    usernameC.dispose();
    emailC.dispose();
    pass1C.dispose();
    pass2C.dispose();
  }

}
