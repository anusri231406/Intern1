// import 'dart:js_interop';

// import 'package:flutter/material.dart';
// import 'package:internship/date_time_helper.dart';
// import 'package:internship/expense_item.dart';

// class ExpenseData extends ChangeNotifier{
//   List<ExpenseItem>overallExpenseList=[];
//   List<ExpenseItem> getAllExpenseList(){
//     return overallExpenseList;
//   }

//   void addNewExpense(ExpenseItem newExpense){
//     overallExpenseList.add(newExpense);
//   }

//   void deleteExpense(ExpenseItem expense){
//     overallExpenseList.remove(expense);
//   }

//   String getDayName(DateTime dateTime){
//     switch(dateTime.weekday){
//       case 1:
//         return 'M';
//       case 2 :
//         return 'T';
//       case 3:
//         return 'W';
//       case 4:
//         return 'T';
//       case 5:
//         return 'F';
//       case 6:
//         return 'S';
//       case 7:
//         return 'S';

        
//       default:
//         return '';

//     }
//   }

//   DateTime start0WeekDate(){
//     DateTime? start0Week;

//     DateTime today=DateTime.now();

//     for(int i=0;i<7;i++){
//       if(getDayName(today.subtract(Duration(days:i)))=='Sun'){
//           start0Week=today.subtract(Duration(days:i));
//       }
//     }
//     return start0Week!;
//   }

//   Map<String,double>calculateDailyExpenseSummary(){
//     Map<String,double>dailyExpenseSummary={};
//     for(var expense in overallExpenseList){
//       String date=convertDataTimeToString(expense.dateTime);
//       double amount= double.parse(expense.amount);
//       if(dailyExpenseSummary.containsKey(date)){
//         double currentAmount=dailyExpenseSummary[date]!;
//         currentAmount+=amount;
//         dailyExpenseSummary[date]=currentAmount;
//       }
//       else{
//         dailyExpenseSummary.addAll({date:amount});
//       }
//      }
//     return dailyExpenseSummary;
//   }
// }