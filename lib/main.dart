import 'package:flutter/material.dart';

void main() => runApp(MainUI());

class MainUI extends StatefulWidget{
  @override
  _MainUIState createState() => _MainUIState();
}
class _MainUIState extends State<MainUI>{

  int index=0;
  List<Widget> list = [
    Home(),
    Profile(),
    Settings()
  ];
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("YatriKosh"),
        ),
        body: list[index],
        drawer: MyDrawer(onTap: (context,i){
          setState(() {
            index=i;
            Navigator.pop(context);
          });
        },),
      ),

    );
  }
}

class MyDrawer extends StatelessWidget {

  final Function onTap;
  
  MyDrawer({
    this.onTap
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/admin.png'),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Tarun",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        "tarunjain1st@gmail.com",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white
                        ),
                      ),
                      
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => onTap(context,0),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => onTap(context,1),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => onTap(context,2),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
              onTap: () => onTap(context,0),
            )
          ],
        ),
      ),

    );
  }
}
