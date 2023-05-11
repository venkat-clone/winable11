import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui show TextHeightBehavior;

import '../utils/utils.dart';

class TimeLeftText extends StatefulWidget {

  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  TimeLeftText(this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  State<TimeLeftText> createState() => _TimeLeftTextState();
}

class _TimeLeftTextState extends State<TimeLeftText> {

  String time="";
  late DateTime date;
  late Timer _timer;
  
  @override
  void initState() {
    date = DateTime.parse(widget.data);
    time = Utils.getTimeLeft(date);
    setTimer();
    super.initState();
  }

  Future setTimer() async {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(time!=Utils.getTimeLeft(date)) {
          setState(() {
            time = Utils.getTimeLeft(date);
        });
      }
    });
}

  Duration getUpdate(DateTime dateTime ){
    final _timeLeft = dateTime.difference(DateTime.now());
    if(_timeLeft.isNegative) return Duration(days: 1);
    if(_timeLeft.inDays>0)
      return Duration(hours: 1);
    if(_timeLeft.inSeconds>0)
      return Duration(seconds: 1);
    return Duration(days: 1);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Text(time,
    style:widget.style,
        strutStyle:widget.strutStyle,
        textAlign:widget.textAlign,
        textDirection:widget.textDirection,
        locale:widget.locale,
        softWrap:widget.softWrap,
        overflow:widget.overflow,
        textScaleFactor:widget.textScaleFactor,
        maxLines:widget.maxLines,
        semanticsLabel:widget.semanticsLabel,
        textWidthBasis:widget.textWidthBasis,
        textHeightBehavior:widget.textHeightBehavior,
        selectionColor:widget.selectionColor,);
  }
}



