import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News {
  @override
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content});

  List<News> newsmodel = [];

  Future<void> getnews() async {
    String mainurl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=80e3f97a7bd24543a5ba6e8d8f2633a8';
    var response = await http.get(Uri.parse(mainurl));
    var data = jsonDecode(response.body);
    if (data['status'] == 'ok') {
      data['articles'].forEach((val) {
        if (val['title'] != null &&
            val['urlToImage'] != null &&
            val['"description'] != null) {
          News nw = News(
            title: val['title'],
            author: val['author'],
            description: val['description'],
            url: val['url'],
            content: val['content'],
            urlToImage: val['urlToImage'],
          );
          newsmodel.add(nw);
        }
      });
    }
  }
}
