import 'package:flutter/material.dart';
import 'package:tsf/screens/adminScreens/baseScreen.dart';

// ignore: must_be_immutable
class AdminNotifications extends StatelessWidget {
  BuildContext? context;
  AdminNotifications({this.context, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BaseUI(
        headline: "NOTIFICATIONS",
        child: 
        Column(
          children: [
            const SizedBox(height: 20,),
            
            Container(
              height: 600,
              width: double.infinity,
              
              child: SingleChildScrollView(
                child: Table(
                   
                  columnWidths:   {
                        0: FlexColumnWidth(10 ),
                        1: FlexColumnWidth(10),
                        2: FlexColumnWidth(10),
                        3: FlexColumnWidth(20),
                        4: FlexColumnWidth(5)},
              
                  defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                border: TableBorder.all(), 
                children: [ 
                  TableRow(
                    children :[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Order ID', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 , ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('So No', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18) , ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Customer Code',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ) ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('User Comments',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Action',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ),),
                    )
                  ]),
                  ...List.generate(100, (index) => _tableRow(index,"123","128013","551","User has asked to change the priority of the request"),)
                ]
              ),
              ),),

            
          ],
        )
        
        )
    );
  }

  TableRow _tableRow(int index , String orderId, String SoNo , String CustomerCode , String Comments) {
    return TableRow(
       decoration: !(index%2==0) ?BoxDecoration(color: Colors.blueGrey[50]): const BoxDecoration(color: Colors.white),
    children :[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(orderId),
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(SoNo),
          ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(CustomerCode),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(children: [Text(Comments)]),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(Icons.more_horiz_sharp),
    ),
  ]);
  }
}
