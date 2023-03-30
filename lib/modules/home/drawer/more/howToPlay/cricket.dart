import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../widget/drop_down_widget.dart';

class Cricket extends StatefulWidget {
  const Cricket({Key? key}) : super(key: key);

  @override
  State<Cricket> createState() => _CricketState();
}

class _CricketState extends State<Cricket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cricket"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              children: [
                ExpansionTile(
                  initiallyExpanded: true,
                    title: Text("Creating Your Team"),
                  children: [
                    htmlText("""<div >
                                        <ul>
                                            <li>Every cricket team you build on Dream11 must have <span>11 players</span></li>
                                            <li>A maximum of <span>10 players</span> can be selected from any one of the teams</li>
                                           
                                        </ul>
                                    </div>"""),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide()
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Player Type',
                                          style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Min',
                                        style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Max',
                                        style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ],
                              ),

                              TableRow(
                                children: [
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Wicket Keeper - WK'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('8'),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Batter - BAT'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('8'),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('All Rounder - AR'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('8'),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Bowler - BWL'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('8'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage("assets/gif/create_teams_cricket.gif"),
                        width: MediaQuery.of(context).size.width*0.85,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Captain and Vice-Captain Points",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.start,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage("assets/gif/captain_vice_captain_cricket.gif"),
                        width: MediaQuery.of(context).size.width*0.85,
                      ),
                    ),
                    htmlText("Once you have selected your 11 players, you will have to assign a captain and vice-captain for your team."),
                    htmlText("The captain will give you <span>2x points</span> scored by them in the actual match."),
                    htmlText("The vice-captain will give you <span>1.5x points</span> scored by them in the actual match."),
                  ],
                ),
                ExpansionTile(
                    title: Text("Other Important Points"),
                children: [
                  htmlText("<ul>"
                      "<li><span></span>"
                      "<div><strong>Rules about substitutes:</strong></div>"
                      "<ul>"
                      "<li><span></span>"
                      "<div>The announced Concussion, COVID-19, X-Factor or Impact Player substitutes will get <strong>0</strong> points for being announced. Out of the announced substitutes, <strong>ONLY</strong> those that will play will be awarded <strong>4 points</strong> in addition to the points for all the contributions they make as per the Fantasy Point System. </div>"
                      "</li>"
                      "<li><span></span>"
                      "<div>Substitutes apart from Concussion, COVID-19, X-Factor or Impact Player substitutes will not be awarded points for any contribution they make. </div>"
                      "</li>"
                      "<li><span></span>"
                      "<div>If a player gets replaced by an X-Factor or Impact Player substitute, but later comes back on field, they will get points for their contributions. However, if a player, who was not a part of the announced lineups, comes to the field as a substitute, they will not get points for any of their contributions (except Concussion, COVID-19, X-Factor and Impact Player substitutes). </div>"
                      "</li>"

                      "</ul>"
                      "</li>"

                      "<li><span></span>"
                      "<div>A player who has been transferred from one team to the other might still be available for selection for his older team until the next scheduled team update on Dream11. However, no points will be attributed to the player in such a situation. </div>"
                      "</li>"
                      "<li><span></span>"
                      "<div>If a player is announced in the starting eleven of a team but later is unable to start the match, he/she will not score any points. The player who plays as the replacement, however, will earn points for the match (including starting points). </div>"
                      "</li>"
                      "<li><span></span>"
                      "<div>No points will be awarded for any actions during a Super Over or a Super Five. </div>"
                      "</li>"
                      "<li><span></span>"
                      "<div>Data is provided by reliable sources and once the match has been marked as completed i.e., winners have been declared, no further adjustments will be made. Points awarded live in-game are subject to change as long as the match status is 'In progress' or 'Waiting for review'. </div>"
                      "</li>"
                      "<li><span></span>"
                      "<div>More than 11 players from either team are allowed to play in Other OD/Other T20/Other Test matches.</div>"
                      "</li>"
                      "<li>"
                      "<span></span>"
                      "<div>No points will be awarded for Strike rate, Economy rate, or Maidens in ‘The Hundred’. </div>"
                      "</li>"
                      "<li>"
                      "<span></span>"
                      "<div>As per official sources, runs scored off a ‘Mystery Ball’ will <strong>not</strong> be credited to the batter’s score and a batter will <strong>not</strong> get points for runs scored on this delivery for 6ixty. </div>"
                      "</li>"
                      "<li>"
                      "<span></span>"
                      "<div>As per official sources, runs and wickets scored off a ‘Mystery Ball’ will <strong>not</strong> be credited to the bowler’s figure and a bowler will <strong>not</strong> get or lose points for runs scored on this delivery for 6ixty. </div>"
                      "</li>"
                      "</ul>")
                ],)
              ],
          ),
        ),
      ),
    );
  }

  Widget htmlText(String data){
    return Html(
      data:data,
      style: {
        "li": Style(
          fontSize: FontSize.medium,
        ),
        "span": Style(
          fontWeight: FontWeight.bold,
        ),
      },
    );
  }

}





