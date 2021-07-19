import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/categorymain.dart';
import 'package:newsapp/drawer.dart';
import 'package:newsapp/model/category%20model.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: GradientText(
            text: 'NEWS-UP',
            colors: <Color>[Color(0xff35C8F6), Color(0xff35C8F6)],
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Rakkas',
            ),
          ),
        ),
        elevation: 1.0,
        iconTheme: IconThemeData(color: Color(0xff35C8F6)),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: cm.length,
          itemBuilder: (context, index) => new Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Opener(topic: cm[index].topic)));
                },
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          cm[index].url,
                          height: 240,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        cm[index].topic.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Rakkas',
                            fontSize: 40),
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Divider(
                height: 3,
                thickness: 2,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
