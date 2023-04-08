// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:newsports/utils/utils.dart';

import '../../../base_classes/value_state.dart';
import '../../../models/Contest.dart';
import '../../../models/Winnings.dart';

class DetailPage extends StatelessWidget {

  DetailPage({
    required this.winnings,
    required this.winningNote
});
  String winningNote;
  ValueState<List<Winning>> winnings ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(winningNote.isNotEmpty)SizedBox(
                height: 10,
              ),
              if(winningNote.isNotEmpty)Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  AppLocalizations.of(winningNote),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black87,
                        letterSpacing: 0.6,
                        fontSize: 12,
                      ),
                ),
              ),
              if(winningNote.isNotEmpty)SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of('RANK'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('PRIZE'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black87,
                            letterSpacing: 0.6,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              Divider(),
              if(winnings.value!=null) (winnings.value!.isNotEmpty)? ListView.separated(
                shrinkWrap: true,
                  itemCount: winnings.value!.length,
                  itemBuilder: (c,index){
                    return row(
                        "# ${((winnings.value?[index].rank)??"").replaceAll("-0", "")}",
                        '₹${Utils.convertToIndianCurrency(int.parse(winnings.value?[index].price??"0"))}',
                        context
                    );
                  },
                  separatorBuilder: (c,index){
                    return SizedBox(
                      height: 15,
                    );
                  },
              ): Center(
                child: Text("NO Winnings for this contest"),
              ),

              Divider(),
            ],
          ),
        ],
      ),
    );
  }

  Widget row(String txt1, String txt2,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: Row(
        children: [
          Text(
            txt1,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(child: SizedBox()),
          Text(
            txt2,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
