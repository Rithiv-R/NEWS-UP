import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapp/model/categoryspecificmodel.dart';
import 'package:newsapp/view/webview.dart';

class Opener extends StatefulWidget {
  String topic;
  Opener({this.topic});
  @override
  _OpenerState createState() => _OpenerState();
}

class _OpenerState extends State<Opener> {
  String t1;
  List<CategorySpecific> mode = [];
  @override
  void initState() {
    // TODO: implement initState
    fetchdata(widget.topic);
    super.initState();
    t1 = widget.topic.toUpperCase();
  }

  fetchdata(String category) async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&pagesize=100&apiKey={Your API}'));
    setState(() {
      var article = jsonDecode(response.body);
      if (article['status'] == 'ok') {
        article['articles'].forEach((element) {
          if (element['urlToImage'] != null &&
              element['description'] != null &&
              element['title'] != null &&
              element['author'] != null &&
              element['url'] != null) {
            CategorySpecific nw = CategorySpecific(
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GradientText(
                  text: 'NEWS-UP',
                  colors: <Color>[Color(0xff35C8F6), Color(0xff35C8F6)],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Rakkas',
                  ),
                ),
                Text(
                  '($t1)',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff7F4AEF),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rakkas'),
                ),
              ],
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
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
