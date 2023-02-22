import 'package:flutter/material.dart';
Widget Function() loading = ()=>Container(
  color :Colors.grey.shade50.withOpacity(0.4),
  child: Center(child: CircularProgressIndicator()),
);

class DefaultStateWidget extends StatefulWidget {
  Widget Function()? loading = ()=>Container(
    color :Colors.grey.shade50.withOpacity(0.4),
    child: Center(child: CircularProgressIndicator()),
  );
  Widget Function(String message)? error = (message)=>Container(
    color :Colors.grey.shade50.withOpacity(0.4),
    child: Center(child: Text(message,style: TextStyle(color: Colors.red),),),
  );

  DefaultStateWidget({Key? key,this.loading,this.error}) : super(key: key);
  // DefaultStateWidget({Key? key}) : super(key: key);


  @override
  _DefaultStateWidgetState createState() => _DefaultStateWidgetState();
}

class _DefaultStateWidgetState extends State<DefaultStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
