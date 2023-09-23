// import 'package:flutter/material.dart';

// import 'demo.dart';
// class ChartBar extends StatelessWidget { 
//    final String label;  
//    final double spendingAmount;  
//    final double spendingPercentage;  
//    ChartBar(this.label, this.spendingAmount, this.spendingPercentage); 
//     @override  Widget build(BuildContext context) {    
//       return Column(      
//         children: [        
//           Text('\$${spendingAmount.toStringAsFixed(0)}'),        
//           SizedBox(height: 4),        
//           Container(         
//              height: 60,         
//               width: 10,          
//               child: Stack(            
//                 children: [              
//                   Container(                
//                     decoration: BoxDecoration(                  
//                       border: Border.all(color: Colors.grey, width: 1.0),                  
//                       color: Color.fromRGBO(220, 220, 220, 1),                  
//                       borderRadius: BorderRadius.circular(10),                
//                       ),              ),              
//                       FractionallySizedBox(               
//                          heightFactor: spendingPercentage,                
//                          child: Container(                  
//                           decoration: BoxDecoration(                    
//                             color: Theme.of(context).primaryColor,                    
//                             borderRadius: BorderRadius.circular(10),                
//                               ),                ),              ),            
//                               ],          ),        ),        
//                         SizedBox(height: 4),        
//                         Text(label),      
//                         ],    );  }}

// class MyApp extends StatelessWidget {  
//   List<Transaction> get _recentTransactions {  var _userTransactions;
//   return _userTransactions.where((tx) {    return tx.date.isAfter(      DateTime.now().subtract(        const Duration(days: 7),      ),    );  }).toList();}
//   @override  Widget build(BuildContext context) {   
     
//     return MaterialApp(      
//       home: Scaffold(        
//         appBar: AppBar(          
//           title: Text('My App'),        
//           ),        
//           body: Column(          
//             children: [            
//               // Other widgets...            
//               Chart(_recentTransactions),            
//               // Other widgets...          
//               ],        ),      ),    );  }}

// class Transaction {  
//   //final String id;  
//   final String title;  
//   final double amount;  
//   final DateTime date;  
//   Transaction({    
//     //required this.id,    
//     required this.title,    
//     required this.amount,    
//     required this.date,  });}



// //import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import './chart_bar.dart';
// // import '../models/transaction.dart';
// class Chart extends StatelessWidget {  
//   final List<Transaction> recentTransactions;  
//   Chart(this.recentTransactions);  
//   List<Map<String, dynamic>> get groupedTransactionValues {    
//     return List.generate(7, (index) {      
//       final weekDay = DateTime.now().subtract(        
//         Duration(days: index),      );      
//         var totalSum = 0.0;      
//         for (var i = 0; i < recentTransactions.length; i++) {        
//           if (recentTransactions[i].date.day == weekDay.day &&           
//            recentTransactions[i].date.month == weekDay.month &&            
//            recentTransactions[i].date.year == weekDay.year) {          
//             totalSum += recentTransactions[i].amount;        }      }      
//             return {        'day': DateFormat.E().format(weekDay).substring(0, 1),        
//             'amount': totalSum,      };    }).reversed.toList();  }  
//             double get totalSpending {    
//               return groupedTransactionValues.fold(0.0, (sum, item) {      
//                 return sum + double.parse(item['amount'].toString());    });  }  
//           @override  Widget build(BuildContext context) {    
            
//             return Card(      
//               elevation: 6,     
//                margin: EdgeInsets.all(20),      
//                child: Padding(        
//                 padding: EdgeInsets.all(10),        
//                 child: Row(         
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,         
//                     children: groupedTransactionValues.map((data) {            
//                       return Flexible(              
//                         fit: FlexFit.tight,              
//                         child: ChartBar(                
//                           data['day'].toString(),                
//                           double.parse(data['amount'].toString()),               
//                            totalSpending == 0.0                    ? 0.0                    : 
//                            (data['amount'] as double) / totalSpending,              
//                            ),            );          }).toList(),        ),      ),    );  }}
