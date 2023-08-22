import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../colors/colorsrepertory.dart';


class HorizontalPercent extends StatefulWidget {
  const HorizontalPercent({super.key, required this.index});
  final int index;

  @override
  State<HorizontalPercent> createState() => _HorizontalPercentState();
}

class _HorizontalPercentState extends State<HorizontalPercent> {
  List <double> percents = [0.9, 0.7, 0.3, 0.6, 0.4].reversed.toList();
  @override
  Widget build(BuildContext context) {
    List<Color>myColors = ColorsRepertory().colorApp0;
    
    return Padding(
              padding: const EdgeInsets.all(15.0),
              child:  LinearPercentIndicator(
                width: MediaQuery.of(context).size.width*.275,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: percents[widget.index-1],
                linearGradient : const LinearGradient(begin: Alignment.topLeft, 
            end: Alignment.topRight, 
            colors: [Colors.blue, Color.fromRGBO(70, 184, 209, 1) ,],),
                center: Text("${percents[widget.index-1]*100} %", style: GoogleFonts.raleway(color: myColors[0], fontWeight: FontWeight.bold),),
                barRadius: const Radius.circular(3),
                
                
              ),
            );
  }
}