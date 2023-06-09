// ignore_for_file: deprecated_member_use



import 'dart:math';

import 'package:newsports/Language/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:newsports/modules/matchDetail/matchDetailPage.dart';

class FilterPage extends StatefulWidget {

  Function(int,int) save;

  int selectedPrizePool ;
  int selectedEntry ;

  FilterPage({
    required this.save,
    required this.selectedPrizePool,
    required this.selectedEntry,
  });

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

    static final List<double> entryList =[1,50,100,1000];
    final entryMap =entryList.asMap().entries;

    static final List<double> prizePoolList =[1,10000,100000,1000000,2500000];
    final prizePoolMap =prizePoolList.asMap().entries;

    int selectedPrizePool = -1;
    int selectedEntry = -1;
    String getString(double cost){
      if(cost%100000==0){
        return '${cost~/100000} Lakh';
      }
      if(cost%1000==0){
        return '${cost~/1000},000';
      }
      return cost.toString();
    }



    @override
  void initState() {
      selectedPrizePool =widget.selectedPrizePool;
      selectedEntry =widget.selectedEntry;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Theme.of(context).textTheme.headline6!.color,
              ),
              Container(
                color: Color(0xffF3F3F3),
                height: AppBar().preferredSize.height,
                child: appBar(),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of('Entry'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .color,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            children:
                            entryMap.map((value) {
                              final active = selectedEntry==value.key;
                              print(entryMap);
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedEntry = value.key;
                                  });
                                },
                                child: txtContainer("₹${getString(value.value)}${entryList.length>value.key+1?'-₹'+getString(entryList[value.key+1]):' & above'}",
                                    active:active
                                ),
                              );
                            })
                                .toList(),

                          ),

                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, right: 20),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         AppLocalizations.of('Number of Teams'),
                    //         style: Theme.of(context).textTheme.caption!.copyWith(
                    //               color: Theme.of(context)
                    //                   .textTheme
                    //                   .headline6!
                    //                   .color,
                    //               letterSpacing: 0.6,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 16,
                    //             ),
                    //       ),
                    //       SizedBox(
                    //         height: 15,
                    //       ),
                    //       Row(
                    //         children: [
                    //           txtContainer("2"),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           txtContainer("3-10"),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           txtContainer("11-100"),
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         height: 10,
                    //       ),
                    //       txtContainer("1,000 & above"),
                    //       SizedBox(
                    //         height: 15,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Divider(
                    //   thickness: 1.5,
                    // ),


                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of('Prize Pool'),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .color,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            children:
                              prizePoolMap.map((value) {
                              final active = selectedPrizePool ==value.key;
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectedPrizePool = value.key;
                                      });
                                    },
                                    child: txtContainer("₹${getString(value.value)}${prizePoolList.length>value.key+1?'-₹'+getString(prizePoolList[value.key+1]):' & above'}",
                                        active:active
                                    ),
                                  );
                              })
                                  .toList(),

                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, right: 20),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         AppLocalizations.of('Contest Type'),
                    //         style: Theme.of(context).textTheme.caption!.copyWith(
                    //               color: Theme.of(context)
                    //                   .textTheme
                    //                   .headline6!
                    //                   .color,
                    //               letterSpacing: 0.6,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 16,
                    //             ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Divider(
                    //   thickness: 1.5,
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Pair<double,double>? entityFilter;
                      if(selectedEntry!=-1){
                        entityFilter = Pair(entryList[selectedEntry], selectedEntry+1<entryList.length?entryList[selectedEntry+1]:double.infinity);
                      }
                      Pair<double,double>? prizePollFilter;
                      if(selectedPrizePool!=-1){
                        entityFilter = Pair(prizePoolList[selectedPrizePool], selectedPrizePool+1<prizePoolList.length?prizePoolList[selectedPrizePool+1]:-1);
                      }

                      widget.save(selectedEntry,selectedPrizePool);

                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff317E2F),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Apply'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).appBarTheme.color,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget txtContainer(String txt, {bool active = false}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: active?Theme.of(context).primaryColor:Theme.of(context).disabledColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
          child: Text(
            txt,
            style: Theme.of(context).textTheme.caption!.copyWith(
              color: active?Theme.of(context).primaryColor: Colors.black54,
                  letterSpacing: 0.6,
                  fontSize: 12,
                ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: Theme.of(context).textTheme.headline6!.color,
              size: 24,
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            AppLocalizations.of('Filter'),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).textTheme.headline6!.color,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: (){
              setState(() {
                selectedPrizePool = -1;
                selectedEntry =-1;
              });
            },
            child: Text(
              AppLocalizations.of('CLEAR'),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).textTheme.headline6!.color,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
