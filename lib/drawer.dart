import 'package:flutter/material.dart';
import 'package:newsapp/categories.dart';
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
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Category()));
              },
              child: ButtonTile(
                icon: Icons.category,
                text: 'Category',
              ),
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
                  'https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEWS-UP',
                    style: TextStyle(
                        fontFamily: 'Rakkas',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('NAME:',
                          style: TextStyle(
                            fontFamily: 'Rakkas',
                          )),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text(
                        'Liya',
                        style: TextStyle(
                            fontFamily: 'Rakkas',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 3)),
                  Text(
                    'Liya@gmail.com',
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
