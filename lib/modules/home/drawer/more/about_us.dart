import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("About Us"),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: "https://winable11.com/about-us",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
