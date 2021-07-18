import 'dart:io';

import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Webviewer extends StatefulWidget {
  String weburl;
  Webviewer({this.weburl});
  @override
  _WebviewerState createState() => _WebviewerState();
}

class _WebviewerState extends State<Webviewer> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
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
        iconTheme: IconThemeData(color: Color(0xff35C8F6)),
      ),
      url: widget.weburl,
    );
  }
}
