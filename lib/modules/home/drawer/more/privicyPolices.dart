import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class PrivacyPolices extends StatefulWidget {
  const PrivacyPolices({Key? key}) : super(key: key);

  @override
  State<PrivacyPolices> createState() => _PrivacyPolicesState();
}

class _PrivacyPolicesState extends State<PrivacyPolices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Privacy Polices"),
          centerTitle: true,
        ),
        body:  FutureBuilder(
          future: rootBundle.loadString('assets/html/Winable_Privacy_Policy.html'),
          builder: (c,s){
            if(s.data==null){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(child: Html(data: s.data));
          },
        )

    );
  }

}
