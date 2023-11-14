import 'package:flutter/material.dart';

class BaseUI extends StatelessWidget {
  Widget child;
  String headline;
   BaseUI({required this.child , required this.headline  ,super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[300],
        child: Padding(
          padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width<500?20:220, top:50 , right: 20),
          child: Column(mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Text(headline, style: TextStyle(fontSize: 40, color: Colors.grey[700] , fontWeight: FontWeight.bold),),
            Divider(),
            child
          ]),
        ),
      );
  }
}