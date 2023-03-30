import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class FootBall extends StatefulWidget {
  const FootBall({Key? key}) : super(key: key);

  @override
  State<FootBall> createState() => _FootBallState();
}

class _FootBallState extends State<FootBall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Football"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              initiallyExpanded: true,
              title: Text("Creating Your Team"),
              children: [
                Image(
                  image: AssetImage("assets/gif/create_teams_football.gif"),
                  width: MediaQuery.of(context).size.width*0.85,
                ),

                htmlText(""" Every football team you build on Dream11 has to have 11 players, of which a maximum of 7 players can be from any one team playing the real-life match."""),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TiTleWidget(text:"Player Combinations"),
                ),
                htmlText(""" Your Dream11 can have different combinations of players, but has to be within the 100 credit cap and must qualify the following team selection criteria:"""),
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
                                    child: Text('Goalkeeper'),
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
                                    child: Text('1'),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Defender'),
                                  ),
                                ),
                                TableCell(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('3'),
                                  ),
                                ),
                                TableCell(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('5'),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Midfielder'),
                                  ),
                                ),
                                TableCell(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('3'),
                                  ),
                                ),
                                TableCell(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('5'),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Forward'),
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
                                    child: Text('3'),
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
                  child: TiTleWidget(text:"Captain and Vice-Captain Points"),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("assets/gif/captain_vice_captain_football.gif"),
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
                htmlText(""" <ul>
                                <li>
                                    <div>We get all our stats from Opta, the world's leading football data provider. However, in case there is a clear error from our provider's end, we may modify the stats.</div>
                                </li>
                                <li><span></span>
                                    <div>The player you choose to be your team’s Captain will receive <strong>2 times</strong> the points for his/her performance</div>
                                </li>
                                <li><span></span>
                                    <div>The player you choose to be your team’s Vice-captain will receive <strong>1.5 times</strong> the points for his/her performance</div>
                                </li>
                                <li><span></span>
                                    <div>54 minutes and 1 second onwards (54’1”) will be considered as 55 minutes for the purpose of point calculation.</div>
                                </li>
                                <li><span></span>
                                    <div>Once a match has been marked as <strong>completed</strong> and winners have been <strong>declared</strong>, no further adjustments will be made to the points awarded. Points awarded for a LIVE game will be subject to change only when the match status is <strong>“In Progress”</strong> or <strong>“In Review”</strong>.</div>
                                </li>
                                <li><span></span>
                                    <div>Any event during extra time will be considered for awarding points</div>
                                </li>
                                <li><span></span>
                                    <div>Any event during penalty shootouts will not be considered for awarding points</div>
                                </li>
                                <li><span></span>
                                    <div>Starting points are assigned to any player on the basis of announcement of his/her inclusion in the team. However, in case the player is unable to start the match after being included in the team sheet, he/she will not score any points. Points shall however, be applicable (including starting points) to any player who plays as a replacement of such player to whom starting points were initially assigned.</div>
                                </li>
                                <li><span></span>
                                    <div><strong>Fantasy Points for the ISL will be awarded based on the information and stats provided by the official ISL score providers. The information on the official scorecard will override all conditions mentioned for assists, passes, etc. THE OFFICIAL ISL SCORECARD IS THE FINAL POINT OF REFERENCE FOR AWARDING POINTS IN FANTASY ISL.</strong></div>
                                </li>
                                <li><span></span>
                                    <div>In case a player is transferred/reassigned to a different team between two scheduled updates, for any reason whatsoever, such transfer/reassignment (by whatever name called) shall not be reflected in the roster of players until the next scheduled update. It is clarified that during the intervening period of two scheduled updates, while such player will be available for selection in the team to which the player originally belong, no points will be attributable to such player during the course of such contest.</div>
                                </li>
                                <li><span></span>
                                    <div>A player who has not participated in the game as part of the starting 11 or as a substitute, will not be awarded negative points for receiving a yellow or red card for off field activity</div>
                                </li>
                                <li><span></span>
                                    <div>If a goal is scored from a penalty or direct free-kick, the player earning the foul is awarded an assist only if someone else from their team scores the goal. If the player earning the penalty or free-kick scores the goal themselves, they will only earn points for the goal and NOT the assist.</div>
                                </li>
                                <li><span></span>
                                    <div>In case the player does not play the match at all, no points will be given.</div>
                                </li>
                                <li><span></span>
                                    <div>If a player received a yellow or red card for an off-field activity, the Fantasy Points will come into effect if</div>
                                    <ul class="sub-list">
                                        <li><em>a)</em>
                                            <div>He already played the match and was subbed off</div>
                                        </li>
                                        <li><em>b)</em>
                                            <div>He comes on the field as substitute after receiving a yellow card and plays the match</div>
                                        </li>
                                    </ul>
                                </li>

                            </ul>""")
              ],)

          ],
        ),
      )
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
class TiTleWidget extends StatelessWidget {
  String text;
  TiTleWidget({Key? key,this.text=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.start,
      ),
    );
  }
}

