import 'package:flutter/material.dart';
import 'package:flutter_auth_system/views/pages/register_page.dart';


class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HVT',
              style: TextStyle(
                letterSpacing: 10.0,
                fontSize: 22.0

              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.white10,
                  
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.blueGrey,
                  child: Image.asset(
                    'assets/images/chat_1.png'
                    )),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: Size(300, 50),
                backgroundColor: Colors.blueAccent,
                elevation: 4,
                foregroundColor: Colors.white
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) {
                  return RegisterPage();
                },)
                );
            }, child: Text(
              'Get Started',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
              ),
            ),
        
          ],
        ),
      ),
    );
    
  }
}