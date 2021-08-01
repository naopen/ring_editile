import 'package:flutter/material.dart';
import 'package:ring_sns/api/accountAPI.dart';
import 'package:ring_sns/main.dart';
import 'chat.dart';
import 'package:ring_sns/api/auth.dart';
import 'package:ring_sns/page/usersetting.dart';

//　by　Masayoshi
//  by Masayoshi
class Home extends StatefulWidget {
  Home(this.auth);
  Auth auth;
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Chat',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  String privateID = "";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Enter a search ID',
            //   ),
            //   onChanged: (text) {
            //     // text = privateID;
            //     privateID = text;
            //     print(privateID);
            //   },
            // ),
            // RaisedButton(
            //   child: Text('ID情報渡す'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => ChatDemo(privateID, widget.auth)),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('「音楽，Apex」でマッチング'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatDemo('user:6195', widget.auth)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('「ゲーム」でマッチング'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatDemo('user:6194', widget.auth)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('「ドラマ」でマッチング'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.blue[900],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[400],
        onTap: _onItemTapped,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Ring',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Usersetting(widget.auth)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
