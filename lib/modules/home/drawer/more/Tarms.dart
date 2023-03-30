import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:docx/docx.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {


  @override
  Widget build(BuildContext context) {
    // PDFDocument doc = await PDFDocument.fromAsset('assets/my_doc.pdf');
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: rootBundle.loadString('assets/html/Terms_Conditions.html'),
          builder: (c,s){
            if(s.data==null){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(child: Html(data: s.data));
          },
        ),
      ),

    );
  }






}



