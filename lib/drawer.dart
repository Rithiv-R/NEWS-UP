import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff6FD8F9), Colors.white])),
        child: ListView(
          padding: EdgeInsets.all(25),
          children: <Widget>[
            ProfileTile(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: ButtonTile(
                icon: Icons.home,
                text: 'Home',
              ),
            ),
            ButtonTile(
              icon: Icons.category,
              text: 'Category',
            ),
            ButtonTile(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget ButtonTile({@required icon, @required text}) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Text(
            text.toString().toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Rakkas'),
          ),
          trailing: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        Divider(
          height: 2,
          thickness: 2,
        ),
      ],
    );
  }

  Widget ProfileTile() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1520223297779-95bbd1ea79b7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                ),
              ),
              Column(
                children: [
                  Text(
                    'LIYA SABASTIAN',
                    style: TextStyle(
                        fontFamily: 'Rakkas',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3)),
                  Text(
                    'ID : 19NW2002',
                    style: TextStyle(
                        fontFamily: 'Rakkas',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
        ],
      ),
    );
  }
}
