import 'package:internship/view/individualbar.dart';

class Bardata{

  final double sunamount;
  final double monamount;
  final double tueamount;
  final double wedamount;
  final double thuamount;
  final double friamount;
  final double satamount;
  Bardata({
    required this.sunamount,
    required this.monamount,
    required this.tueamount,
    required this.wedamount,
    required this.thuamount,
    required this.friamount,
    required this.satamount});

    List<Indivisualbar>bardata=[];
    void initialisebardata(){
      bardata=[
        Indivisualbar(x: 0, y: sunamount),
        Indivisualbar(x: 1, y: monamount),
        Indivisualbar(x: 2, y: tueamount),
        Indivisualbar(x: 3, y: wedamount),
        Indivisualbar(x: 4, y: thuamount),
        Indivisualbar(x: 5, y: friamount),
        Indivisualbar(x: 6, y: satamount),
      
      ];

    }

  
  
}
