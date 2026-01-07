import 'package:flutter/material.dart';
import 'package:flutter_auth_system/views/widget_tree.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Card(
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 12.0
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  color: Colors.white10,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white12,
                child: 
                Image.asset(
                  'assets/images/chat.png'
                  ),
              ),
            ),
            SizedBox(height: 20.0,),
            Center(
              child: Column(
                children: [
                  Text('Auth System'),
                  SizedBox(height: 10.0,),
                  Text('SQLITE'),
                  SizedBox(height: 10.0,),
                  Text('</>'),
                  
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage(

                    'assets/images/chat.png',
                    ))),
              child: Text(''),),

              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                enableFeedback: true,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Theme'),
                leading: Icon(Icons.mode_night_outlined),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Files'),
                leading: Icon(Icons.file_copy_sharp),
                onTap: () {
                  Navigator.pop(context);
                },
              ),


              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WidgetTree();
                  },));
                },
              ),

              DrawerButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),

    );

  }
}