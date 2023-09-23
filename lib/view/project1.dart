import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:internship/view/bargraph.dart';
import 'package:internship/view/chart.dart';

// import 'package:fl_chart/fl_chart.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

class Project1 extends StatefulWidget {
  const Project1({super.key});

  @override
  State<Project1> createState() => _Project1State();
}

class _Project1State extends State<Project1> {
  var Title = TextEditingController();
  var Amount = TextEditingController();
  var Date = TextEditingController();
  List<MyData> transaction = [];
  var index=0;
  var _selectedDate;
  
 List<double> weeklysummery=[
    
   
   4.40,
   2.50,
   42.42,
   10.50,
   90.90,
   88.99,
   90.10
       
   ];

  // Function to open the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        print('Date selected :${picked.day}-${picked.month}-${picked.year}');
        //String formattedDate = DateFormat.yMMMMd().format(_selectedDate);
      });
    }}
  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    void onDelete(){
    transaction.removeAt(index);
    setState(() {    
    });  
  }

   

    Widget customTextBox(TextEditingController controller,String label,String hint) {
      return Padding( 
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
               labelText:label ,
               hintText: hint,
               labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(borderSide: BorderSide(
                  color:Color.fromARGB(255, 232, 128, 250),
                ),),
       ),
              
        ),
      );
    }
    Widget makeCard(index){
      return Card(
        child: Container(
          height: height*0.12,
          width: width*0.9,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25,left: 10),
                child: Container(
                      height: height*0.1,
                      width: width*0.2,
                      child: CircleAvatar(
                radius: 50, 
                backgroundColor: const Color.fromARGB(255, 232, 128, 250), 
                child: Center(
                  child: Text('₹ ${transaction[index].amount}',   //amount
                      style: TextStyle(color: Colors.white,fontSize: 18),
                      textAlign: TextAlign.center,
                      ),),)
                        ),
              ),
              Container(child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 25),
                     child: Text(transaction[index].title,style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                   ),
                   Text('${_selectedDate.day.toString()}-${_selectedDate.month.toString()}-${_selectedDate.year.toString()}',style: TextStyle(color: Colors.black,fontSize: 15),),
                 ]),),
              Spacer(),
             IconButton(onPressed: (){onDelete();}, icon: Icon(Icons.delete,color: Colors.red,size: 35,))
            ]),

          // child: ListTile(
          //   leading: CircleAvatar(
          //     radius: 50, 
          //     backgroundColor: const Color.fromARGB(255, 232, 128, 250), 
          //     child: Center(
          //       child: Text('₹ ${transaction[index].amount}',   //amount
          //           style: TextStyle(color: Colors.white),
          //           textAlign: TextAlign.center,
          //           ),),
          //   ),
          //   title: Text(transaction[index].title),// things
          //   subtitle: Text('${_selectedDate.day.toString()}-${_selectedDate.month.toString()}-${_selectedDate.year.toString()}' ),//date
          //   trailing: IconButton(onPressed: (){onDelete();}, icon: Icon(Icons.delete,color: Colors.red,)),
          // ),
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 232, 128, 250),
        title: Text('Khatabook',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add,size: 36,color: Colors.white,),
          ),
        ],
      ),

      body: Column(
        children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container( height: height*0.37,
                  width: width*0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: BarGraph(weeklysummery: weeklysummery),
                    ),
                    
                  ),
                ),
              ),
              Container(
                  height: height * 0.46,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transaction.length,
                    itemBuilder: (context, index) => makeCard(index),
                  ),
                ),
        ],
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton.extended(onPressed: (){
        showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),),
              builder: (context) =>Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    child: Column(
                      children: [
                         ListTile(trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close)),),
                          
                        customTextBox(Title,'Title','Enter Things'),
                
                        customTextBox(Amount,'Amount','Enter Amount'),

                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _selectedDate == null
                                    ? 'No date choosen!'
                                    : ' ${_selectedDate.day.toString()}-${_selectedDate.month.toString()}-${_selectedDate.year.toString()}',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),

                            SizedBox(
                              width: 50.0,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 65),
                              child: TextButton( 
                                child: Text( 
                                  'Choose Date', 
                                  style: TextStyle( 
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold, 
                                    ), ), 
                                    onPressed: () =>_selectDate(context) ,
                                    ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                                              onPressed: () {
                          String title = Title.text;
                          String amount=Amount.text;
                          // Double amount =double.tryParse(Amount.text) as Double;
                          String date= Date.text;
                          MyData data = MyData(
                               title: title,amount: amount, date: date,);
                                      
                                               
                          transaction.add(data);
                          setState(() {});
                          Navigator.pop(context);
                                              },
                                              
                           child: Text(
                          'Add Transection',
                          style: TextStyle(color: Colors.white),
                            ),
                          style: ElevatedButton.styleFrom(    
                          shape: RoundedRectangleBorder(      
                            borderRadius: BorderRadius.circular(0),    
                            ),    
                            backgroundColor: Color.fromARGB(255, 232, 128, 250),  ),
                                            ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              );
      },
          backgroundColor: Colors.amber, 
          shape: CircleBorder(),
          label: Icon(
            Icons.add,size: 40,color: Colors.black,
          ),
          
          ) ,
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<DateTime>('_selectedDate', _selectedDate));
  // }

}

class E {
}

class DateFormat {
  static yMMMMd() {}
}


class MyData{
  String title;
  String amount;
  String date;
  // /Double amount;
  // DateTime date;
 
  MyData({this.title='', this.amount='', this.date='',});
}



