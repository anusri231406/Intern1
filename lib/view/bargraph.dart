import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bardata.dart';

class BarGraph extends StatelessWidget {
   final List weeklysummery;
  const BarGraph({super.key,required this.weeklysummery});
 

  @override
  Widget build(BuildContext context) {
     Bardata mybardata=Bardata(
        sunamount:weeklysummery[0],
        monamount:weeklysummery[1],
        tueamount:weeklysummery[2],
        wedamount:weeklysummery[3],
        thuamount:weeklysummery[4],
        friamount:weeklysummery[5],
        satamount:weeklysummery[6],


    );
    //Bardata.initialisebardata();

    //Bardata.initialisebardata();
    mybardata.initialisebardata();
    return BarChart(
        BarChartData(
        maxY:100,
        minY: 0,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles:AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles:AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget:bottomTitles )),  
        ),
        barGroups: mybardata.bardata.map((data) => BarChartGroupData(
          x:data.x,
          barRods:[ BarChartRodData(
          toY:data.y,
        color:Colors.amber)]
        )).toList()
      )             
    );
  }
}

Widget bottomTitles(double value,TitleMeta meta){
  const style=TextStyle(
    color:Colors.black,
    fontWeight: FontWeight.bold,
    fontSize:12
  );
  Widget title;
switch(value.toInt()){
  case 0:
  title=const Text('S',style: style,);
  break;
  case 1:
  title=const Text('M',style: style,);
  break;
  case 2:
  title=const Text('T',style: style,);
  break;
  case 3:
  title=const Text('W',style: style,);
  break;
  case 4:
  title=const Text('T',style: style,);
  break;
  case 5:
  title=const Text('F',style: style,);
  break;
  case 6:
  title=const Text('S',style: style,);
  break;
   default:
  title=const Text('',style: style,);
  break;

}
// return SideTitleWidget(child:text, axisSide: meta.axisSide);
return SideTitleWidget(child: title, axisSide: meta.axisSide);
}



