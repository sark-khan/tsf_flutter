
import 'package:flutter/material.dart';
import 'package:tsf/screens/adminScreens/baseScreen.dart';

class UserRequests extends StatelessWidget {
  const UserRequests({super.key});

  @override
  Widget build(BuildContext context) {
    // bool _isLoading
    return  Scaffold(
      body:BaseUI(
        headline: "USER REQUESTS",
        child:   Column(
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
                        3: FlexColumnWidth(10),
                        4: FlexColumnWidth(8)},
                  
                  defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                border: TableBorder.all(), 
                children: [ 
                  TableRow(

                    children :[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 , ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18) , ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ) ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Customer Code',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Action',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ),),
                    )
                  ]),
                  ...List.generate(100, (index) => _tableRow(index,"Ankit","Ankit04","ankit@webmobsoft.com","PENDING"),)
                ]
              ),
              ),),

            
          ],
        )
        
        
        
        
        
        
        
        
        
        )
    );
  }

   TableRow _tableRow(int index , String name, String userName , String CustomerCode , String Status) {
    return TableRow(
       decoration: !(index%2==0) ?BoxDecoration(color: Colors.blueGrey[50]): const BoxDecoration(color: Colors.white),
    children :[
     
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name),
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userName),
          ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(CustomerCode),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(Status, style: TextStyle(color: Colors.green , fontSize:18 , fontWeight: FontWeight.bold),),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Wrap(
          spacing: 1,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
    
          children: [
            RawMaterialButton(
  onPressed: () {},
  elevation: 2.0,
  fillColor: Colors.green,
  child: Icon(
    Icons.check,
    size: 15.0,
  ),
  padding: EdgeInsets.all(15.0),
  shape: const CircleBorder(),
),
            
          RawMaterialButton(
  onPressed: () {},
  elevation: 2.0,
  fillColor: Colors.redAccent,
  child: Icon(
    Icons.close,
    size: 15.0,
  ),
  padding: EdgeInsets.all(15.0),
  shape: const CircleBorder(),
)
          ],
        ),
      ),
    ),
  ]);
  }
}