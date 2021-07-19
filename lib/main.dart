import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:newsapp/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/view/webview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEWS-UP',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Newsmodel> mode = [];
  void initState() {
    // TODO: implement initState
    fetchdata();
    super.initState();
  }

  fetchdata() async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&pagesize=100&apiKey=80e3f97a7bd24543a5ba6e8d8f2633a8'));
    setState(() {
      var article = jsonDecode(response.body);
      if (article['status'] == 'ok') {
        article['articles'].forEach((element) {
          if (element['urlToImage'] != null &&
              element['description'] != null &&
              element['title'] != null &&
              element['author'] != null &&
              element['url'] != null) {
            Newsmodel nw = Newsmodel(
              title: element['title'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              author: element['author'],
            );
            mode.add(nw);
          }
        });
      }
    });
  }

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
        body: (mode.length == 0)
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mode.length,
                    itemBuilder: (context, index) => BlogTile(
                          title: mode[index].title,
                          description: mode[index].description,
                          urlToImage: mode[index].urlToImage,
                          url: mode[index].url,
                        )),
              ));
  }
}

class BlogTile extends StatelessWidget {
  String title;
  String description;
  String urlToImage;
  String url;
  BlogTile({this.description, this.title, this.urlToImage, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Webviewer(weburl: url)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  urlToImage,
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(description),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 3,
              thickness: 3,
            )
          ],
        ),
      ),
    );
  }
}
