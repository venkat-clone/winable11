import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/controllers/FeedController.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../Language/appLocalizations.dart';
import '../../../models/MatchModel.dart';
import '../../../models/commentary/Commentaries.dart';
import '../../../models/commentary/MatchComentry.dart';

class Commentary extends StatefulWidget {
  final FeedController feedController ;
  final MatchModel match;
  Commentary({Key? key,
    required this.feedController,
    required this.match,
  }) : super(key: key);

  @override
  _CommentaryState createState() => _CommentaryState(feedController);
}

class _CommentaryState extends StateMVC<Commentary> {

  late FeedController _con ;

  _CommentaryState(FeedController con):super(con){
    _con = controller as FeedController ;
  }

  late ScrollController _scrollController;
  @override
  void initState() {
    initAsync();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Future<bool> initAsync() async{
    await _con.getMatchCommentary(context, widget.match.matchId);
    await _con.getMatchCommentary(context, widget.match.matchId,inning: "2");
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

    return super.initAsync();
  }
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onLoading() async{
    await _con.getMatchCommentary(context, widget.match.matchId);
    await _con.getMatchCommentary(context, widget.match.matchId,inning: "2");
    setState(() {
    _refreshController.loadComplete();
    _refreshController.refreshCompleted();
    });
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

  }

  @override
  Widget build(BuildContext context) {
    if(_con.inning1Commentary.loading) return Center(
      child: CircularProgressIndicator(),
    );
    if(_con.inning1Commentary.error!=null ){
      return Center(
        child: Text(_con.inning1Commentary.error!),
      );
    }
    if(_con.inning1Commentary.value!.commentaries.isEmpty || _con.inning1Commentary.value==null){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              AppLocalizations.of("No Commentary's"),
              style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black54,
                letterSpacing: 0.6,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      );
    }

    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: false,
      onLoading: _onLoading,
      onRefresh: _onLoading,
      child: ListView(
        // reverse: true,
        children: [
          if(_con.inning2Commentary.value!=null) Column(
            children: [
              Container(
                margin : const EdgeInsets.only(top: 0,bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.black.withOpacity(0.4),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                padding: const EdgeInsets.all(16.0),
                child: Text("2nd Inning",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white
                )),
              ),
            ],
          ),
          if(_con.inning2Commentary.value!=null) ..._con.inning2Commentary.value!.commentaries.map((e) {
            return commentaryCard(e);
          }),
          if(_con.inning1Commentary.value!=null) Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            child: Text("1nd Inning",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white
            )),
          ),
          if(_con.inning1Commentary.value!=null)..._con.inning1Commentary.value!.commentaries.map((e) {
            return commentaryCard(e);
          }),

        ],
      ),
      // child: ListView.separated(
      //   reverse: true,
      //   // controller:_scrollController ,
      //   itemCount: _con.inning1Commentary.value!.commentaries.length + (_con.inning2Commentary.value?.commentaries.length??0)+(_con.inning2Commentary.value!=null?1:0),
      //   itemBuilder: (c,i){
      //     if(i<_con.inning1Commentary.value!.commentaries.length)
      //     return commentaryCard(_con.inning1Commentary.value!.commentaries[i]);
      //     else if(i==_con.inning1Commentary.value!.commentaries.length)
      //       return Row(
      //         children: [
      //           Divider(),
      //           Divider(),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Text("2nd Inning",style: Theme.of(context).textTheme.titleLarge),
      //           ),
      //           Divider()
      //         ],
      //       );
      //     else
      //       return commentaryCard(_con.inning2Commentary.value!.commentaries[i - _con.inning1Commentary.value!.commentaries.length-1]);
      //   }, separatorBuilder: (BuildContext context, int index) {
      //     return Divider();
      // },
      //
      // ),
    );
  }


  commentaryCard(Commentaries commentary){
    if(commentary.event=="overend"){
      return Column(
        children: [
            Padding(
            padding: const EdgeInsets.only(left:10.0, right: 15),
            child: Divider(thickness:1, color: Colors.black, height: 5,),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    commentary.commentary,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                    softWrap: true,
                  ),
                ),
                // Column(
                //   children: [
                //     Text("${commentary.over}.${commentary.ball}",style: Theme.of(context).textTheme.titleMedium,),
                //     SizedBox(width: 2,),
                //     Text(commentary.commentary,style: Theme.of(context).textTheme.bodyLarge),
                //   ],
                // ),
              
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0, right: 15),
            child: Divider(thickness:4, color: Colors.black, height: 5,),
          )
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: commentary.getHighlight=="W"?Colors.red:Color.fromARGB(255, 108, 200, 243),
              border: Border.all(color: Colors.black,),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(commentary.getHighlight.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white)),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${commentary.over}.${commentary.ball}",style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(width: 2,),
                Text(commentary.commentary,style: Theme.of(context).textTheme.bodyLarge),
                if(commentary.noball==true)Text("Batsman got ${commentary.noballRun} Extra run for No ball ",
                style: Theme.of(context).textTheme.titleSmall,),
                if(commentary.byeRun!="0")Text("Batsman got ${commentary.byeRun} bye run ",
                style: Theme.of(context).textTheme.titleSmall,),
                if(commentary.legbyeRun!="0")Text("Batsman got ${commentary.legbyeRun} legbye run ",
                style: Theme.of(context).textTheme.titleSmall,),
                if(commentary.wideball==true)Text("Batsman got ${commentary.wideRun} Extra run for Wide ball ",
                style: Theme.of(context).textTheme.titleSmall,),
                if(commentary.event=="wicket")Text("Wicket",
                style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.redAccent)
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }



}
