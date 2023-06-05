
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BaseController extends ControllerMVC {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool loading = false;
  int _loadFunctions =0;

  // void setState(VoidCallback fn) =>setState(fn);

  startLoading()=>setState(() {
    _loadFunctions++;
    loading=true;
  });
  stopLoading()=>setState(() {
    _loadFunctions--;
    loading= !(_loadFunctions==0);
  });

  Future<void> lodeWhile( Future Function() function ) async{
    startLoading();
    await function();
    await Future.delayed(Duration(seconds: 1),);
    stopLoading();
    print("loadCompleted");
  }

  errorSnackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(message ))
    );
  }
  successSnackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            content: Text(message ))
    );
  }
  worningSnackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.orange,
            content: Text(message ))
    );
  }
  infoSnackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            // backgroundColor: Colors.orange,
            content: Text(message ))
    );
  }


}