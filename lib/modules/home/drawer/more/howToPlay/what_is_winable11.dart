import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:video_player/video_player.dart';

import '../../../../../utils/utils.dart';

class WhatIsWinable11 extends StatefulWidget {
  const WhatIsWinable11({Key? key}) : super(key: key);

  @override
  _WhatIsWinable11State createState() => _WhatIsWinable11State();
}

class _WhatIsWinable11State extends State<WhatIsWinable11> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What is Winable11"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            TextWidget(text: "Winable11 is a Game of Skill where you create a team of real players for an upcoming match and compete with other fans for big prizes."),
            Image.asset("assets/images/what-is-d11-steps.png"),
            TiTleWidget(text: "1.Select A Match"),
            SizedBox(height: 20,),
            Image(
              image: AssetImage("assets/gif/select_match.gif"),
            ),
            SizedBox(height: 10,),
            TextWidget(text: "Dream11 hosts games across many different sports. Click on an upcoming match you want to play and keep an eye on the match deadline."),
            SizedBox(height: 30,),
            TiTleWidget(text: "2. Create Your Teams",),
            SizedBox(height: 10,),
            TextWidget(text: "Use your knowledge of sports to pick a team within a budget of 100 credits who you think will score the most points for the selected match."),
            SizedBox(height: 10,),
            Image(
              image: AssetImage("assets/gif/create_teams.gif"),
            ),
            SizedBox(height: 10,),
            TextWidget(text: "Remember, you can create a maximum of 20 teams for select contests with more than 10,000 spots. So, go ahead and make every team count!",),
            TiTleWidget(text: "What are credits?",),
            TextWidget(text: "Credits are the cost of a player. In-form and star players typically cost more credits, while inexperienced or non-regular players cost less."),
            TiTleWidget(text: "What are Fantasy Points?",),
            TextWidget(text: "Fantasy Points are earned by real-life players on the basis of their performances in a match.\n"+
                "For example, players earn points for scoring runs, taking wickets, etc. (cricket), scoring goals, making assists, etc. (football) and similar actions for other sports.\n"+
    "You can check out the Fantasy Points System under each sport for more details.\n"),
            TiTleWidget(text: "Can I edit my team after I create it?",),
            TextWidget(text: "You can edit your team as many times as you like before the match deadline. Go to My Teams on the match page to check all the teams you have created."),
            TiTleWidget(text: "3. Join Contests",),
            SizedBox(height: 10,),
            Image(
              image: AssetImage("assets/gif/join_contest.gif"),
            ),
            SizedBox(height: 10,),
            TextWidget(text: "We have many different contest formats for you to join. Choose between free and paid contests, or even create a new private contest just for you and your friends. You play your way!"),
            TiTleWidget(text: "4. Follow the match",),
            SizedBox(height: 10,),
            Image(
              image: AssetImage("assets/gif/follow_match.gif"),
            ),
            SizedBox(height: 10,),
            TextWidget(text: "Once a match is live, you can follow your contests leaderboards to see how you’re performing against your competition.\n"
              "What’s more, you can even chat with them in real-time through our Contest Chat feature."),
            TiTleWidget(text: "Withdrawing your winnings ?",),
            TextWidget(text: "After a match ends, if you’re in the winning zone for a contest, then your contest winnings are transferred to your account.\n"
              "Use them to join more contests, or withdraw it and celebrate your success!\n"
                  "You’re ready to get started!"),


          ],
        ),
      ),
    );
  }
  
}
@immutable
class TextWidget extends StatelessWidget {
  String text ;
  TextWidget({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14
        ),
      ),
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





