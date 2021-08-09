import 'package:flutter/material.dart';
import 'package:newsapp/news/displaymodel.dart';

class Homemodel extends StatefulWidget {
  @override
  _HomemodelState createState() => _HomemodelState();
}

class _HomemodelState extends State<Homemodel> {
  List<News> newsview = new List<News>();
  bool nodatapresnt = true;
  @override
  void initState() {
    super.initState();
    getter();
  }

  getter() async {
    News newsClass = News();
    await newsClass.getnews();
    newsview = newsClass.newsmodel;
    setState(() {
      nodatapresnt = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return nodatapresnt
        ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: Text(
              nodatapresnt.toString(),
              style: TextStyle(fontSize: 100),
            ),
          );
  }
}
