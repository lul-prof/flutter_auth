import 'package:flutter/material.dart';
import 'package:flutter_auth_system/views/pages/login_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameC=TextEditingController();
  TextEditingController emailC=TextEditingController();
  TextEditingController pass1C=TextEditingController();
  TextEditingController pass2C=TextEditingController();

  void verify(){
    if(usernameC.text.isEmpty || emailC.text.isEmpty || pass1C.text.isEmpty || pass2C.text.isEmpty){
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
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                icon: Icon(Icons.check)),
              )
            ],
          );
        },
        );
    }else{
      if(pass1C.text==pass2C.text){
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
                  onPressed: (){
                     Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                      )
                    );
                  }, 
                icon: Icon(Icons.check)),
              )
            ],
          );
        },
        );
        
      }else{
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
                  onPressed: (){
                     Navigator.pop(context);
                  }, 
                icon: Icon(Icons.check)),
              )
            ],
          );
        },
        );
      }
    }
  }


  @override
  void dispose() {
    super.dispose();
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
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon: Icon(Icons.arrow_back_ios)
                    ),
                    SizedBox(width: 20.0,),
                  Text(
                    'Registration',
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
                onEditingComplete: () {
                  setState(() {
                    
                  });
                },
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
                onEditingComplete: () {
                  setState(() {
                    
                  });
                },
                controller: emailC,
                decoration: 
                InputDecoration(
                  icon: Icon(Icons.email),
                  hint: Text('Email Address'),
                  border: OutlineInputBorder(),
                  ),
              ),
            ),

            SizedBox(height: 30.0,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                onEditingComplete: () {
                  setState(() {
                    
                  });
                },
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


            SizedBox(height: 30.0,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                onEditingComplete: () {
                  setState(() {
                    
                  });
                },
                controller: pass2C,
                obscureText: true,
                decoration: 
                InputDecoration(
                  icon: Icon(Icons.security_update_good),
                  hint: Text('Confirm Password'),
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
                verify();
            }, 
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700
              ),
              ),
            ),
            SizedBox(height: 10.0,),
            TextButton(
              autofocus: false,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return LoginPage();
                },));
              }, 
            child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}