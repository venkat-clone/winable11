import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../base_classes/networkAPIService.dart';

class ApiRoutes extends StatefulWidget {
  const ApiRoutes({Key? key}) : super(key: key);

  @override
  _ApiRoutesState createState() => _ApiRoutesState();
}

class _ApiRoutesState extends State<ApiRoutes> {

  int selected = -1;

  @override
  Widget build(BuildContext context) {

    if(!kDebugMode) return Scaffold(
      appBar: AppBar(
        title: Text("API Calls",style: TextStyle(color: Colors.black54),),
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.black54
        ),
      ),
      body: Center(
        child: Text('Only Devs are allowed to visit this screen'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("API Calls",style: TextStyle(color: Colors.black54),),
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: responseList.length,
            itemBuilder: (c,i){
          final request = responseList[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12)
              ),
              child: InkWell(
                onTap: (){
                  if(selected==i){
                    setState(() {
                      selected = -1;
                    });
                  }else{
                    setState(() {
                      selected = i;
                    });
                  }
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(request.length==3?'Post':'GET',style: TextStyle(
                          color: request.length==3?Colors.redAccent:Colors.green.shade800,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 10,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Clipboard.setData(ClipboardData(text: 'https://admin.winable11.com/'+request[0]));
                              snackBar('Url copied to clip board',color: Colors.grey);
                            },
                            child: Text(request[0],style: TextStyle(
                              color: Colors.black45,
                            ),softWrap: true,textAlign: TextAlign.end,),
                          ),
                        ),
                      ],
                    ),
                    if(selected==i) Container(child: Column(
                      children: [
                        Divider(),
                        Wrap(
                          children: [
                            Text('Response',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                            InkWell(
                              onTap: (){
                                  Clipboard.setData(ClipboardData(text: request[1]));
                                  snackBar('Request response copied to clip board');
                                },
                              child: Text(request[1],style: TextStyle(fontSize: 12,color: Colors.grey.shade700),softWrap: true,),
                            ),
                          ],
                        ),
                      ],
                    )),
                    if(selected==i && request.length==3) Container(child: Column(
                      children: [
                        Divider(),
                        Wrap(
                          children: [
                            Text('Request Body',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                            InkWell(
                                onTap: (){
                                  Clipboard.setData(ClipboardData(text: request[2]));
                                  snackBar('Request body copied to clip board',color: Colors.orange);
                                },
                                child: Text(request[2],style: TextStyle(fontSize: 12,color: Colors.grey.shade700),softWrap: true,)),
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  snackBar(String message,{Color color = Colors.green }){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: color,
            content: Text(message ))
    );
  }

}
