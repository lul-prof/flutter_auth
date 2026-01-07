import 'package:flutter/material.dart';
import 'package:flutter_auth_system/views/pages/home_page.dart';
import 'package:flutter_auth_system/views/pages/register_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameC=TextEditingController();
  TextEditingController pass1C=TextEditingController();


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
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon:Icon(Icons.arrow_back),
                     ),
                     SizedBox(width: 20.0,),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                    ),
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Divider(
                  color: Colors.white10,
                  height: 3,
                ),
              ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: usernameC,
                decoration: 
                InputDecoration(
                  icon: Icon(Icons.person),
                  hint: Text('Username'),
                  border: OutlineInputBorder(),
                  ),
              ),

            ),

          
            SizedBox(height: 30.0,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: pass1C,
                obscureText: true,
                decoration: 
                InputDecoration(
                  icon: Icon(Icons.security),
                  hint: Text('Password'),
                  border: OutlineInputBorder(),
                  ),
              ),
            ),

           
            SizedBox(height: 20.0,),

            FilledButton(
              style: FilledButton.styleFrom(
                elevation: 4.0,
                side: BorderSide(color: Colors.white,width: 2.0),
                shadowColor: Colors.white54,
                backgroundColor: Colors.lightBlueAccent
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return HomePage();
                },));
            }, 
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700
              ),
              ),
            ),
            SizedBox(height: 10.0,),
            TextButton(
              autofocus: false,
              style: TextButton.styleFrom(
                enableFeedback: false
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return RegisterPage();
                },));
              }, 
            child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}