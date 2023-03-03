
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BaseController extends ControllerMVC {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool loading = false;

  // void setState(VoidCallback fn) =>setState(fn);

  startLoading()=>setState(() {loading=true;});
  stopLoading()=>setState(() {loading=false;});

  void lodeWhile( Future Function() function ) async{
    startLoading();
    await function();
    stopLoading();
  }

  snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(message ))
    );
  }


}