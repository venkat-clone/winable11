// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../models/player.dart';

class PlayerCardView extends StatefulWidget {
  final String? txt1;
  final String? txt2;
  final String? txt3;
  final String? txt4;
  final String? txt5;
  final String? txt6;
  final ImageProvider? image1;
  final bool selected ;
  Player? player;


  PlayerCardView({
    Key? key,
    this.txt1,
    this.txt2,
    this.txt3,
    this.txt4,
    this.txt5,
    this.txt6,
    this.image1,
    this.player,
    this.selected = false
  }) : super(key: key);

  @override
  State<PlayerCardView> createState() => _PlayerCardViewState();
}

class _PlayerCardViewState extends State<PlayerCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 85,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: widget.image1!,
                            fit: BoxFit.cover,
                            onError:(o,s){

                            }
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            widget.txt1!,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .color,
                                      letterSpacing: 0.6,
                                      fontSize: 10,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.txt2!,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 12,
                            ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.txt3!,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.txt4!,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    widget.txt5!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    widget.txt6!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 12,
                          color:Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .color,
                        ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:widget.selected? Colors.red:Color(0xff317E2F),
                      ),
                    ),
                    child: widget.selected? Icon(
                      Icons.remove,
                      color: Colors.red,
                      size: 22,
                    ): Icon(
                      Icons.add,
                      color: Color(0xff317E2F),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
