import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../colors/colorsrepertory.dart';




class ShowBarChart extends StatefulWidget {
  ShowBarChart({super.key});
  final List<Color>myColors = ColorsRepertory().colorApp0;
  final List <BarChartGroupData> barGroups = [
          BarChartGroupData(x: 0,
          barRods: [ 
            BarChartRodData(toY:10, 
            gradient: const LinearGradient(begin: Alignment.bottomCenter, 
            end: Alignment.topCenter, 
            colors: [Colors.blue, Color.fromRGBO(70, 184, 209, 1) ,],), 
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), 
            topRight: Radius.circular(10)), width: 30.w, 
            backDrawRodData: BackgroundBarChartRodData(toY: 90, 
            color: Colors.red, show: false)),
          
          ]), 
          BarChartGroupData(x: 1,
          barRods: [ 
            BarChartRodData(toY: 7.5, 
            gradient: const LinearGradient(begin: Alignment.bottomCenter, 
            end: Alignment.topCenter, 
            colors: [Colors.blue, Color.fromRGBO(70, 184, 209, 1) ,],), 
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), 
            topRight: Radius.circular(10)), width: 30.w, 
            backDrawRodData: BackgroundBarChartRodData(toY: 90, 
            color: Colors.red, show: false)),
          
          ]), 
          BarChartGroupData(x: 2,
          barRods: [ 
            BarChartRodData(toY: 6, 
            gradient: const LinearGradient(begin: Alignment.bottomCenter, 
            end: Alignment.topCenter, 
            colors: [Colors.blue, Color.fromRGBO(70, 184, 209, 1) ,]), 
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), 
            topRight: Radius.circular(10)), width: 30.w, 
            backDrawRodData: BackgroundBarChartRodData(toY: 90, 
            color: Colors.red, show: false)),
          
          ]), 
          BarChartGroupData(x: 3,
          barRods: [ 
            BarChartRodData(toY: 7, 
            gradient: const LinearGradient(begin: Alignment.bottomCenter, 
            end: Alignment.topCenter, 
            colors: [Colors.blue, Color.fromRGBO(70, 184, 209, 1) ,],), 
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), 
            topRight: Radius.circular(10)), width: 30.w, 
            backDrawRodData: BackgroundBarChartRodData(toY: 90, 
            color: Colors.red, show: false)),
          
          ]), 
          
        ];

  @override
  State<ShowBarChart> createState() => _ShowBarChartState();
}

class _ShowBarChartState extends State<ShowBarChart> {

  List <BarChartGroupData> barGroups = ShowBarChart().barGroups;
  @override
  Widget build(BuildContext context) {
    List<Color>myColors = ColorsRepertory().colorApp0;
    return BarChart(
      BarChartData(

        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceEvenly,
        gridData: const FlGridData(show: false), 
        titlesData: FlTitlesData(topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)) ,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)), 
        bottomTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 30.w, showTitles: true, getTitlesWidget: (value, meta){
          if (value == 0 ){
            return  Text("CEPD", style: TextStyle(color:  const Color.fromRGBO(44, 68, 100, 1), fontSize: 13.sp, fontWeight: FontWeight.bold),);
          }else if (value == 1){
            return  Text('BEPC', style: TextStyle(color: const Color.fromRGBO(44, 68, 100, 1), fontSize: 13.sp, fontWeight: FontWeight.bold),);
          }else if (value == 2){
            return  Text('BAC 1', style: TextStyle(color: const Color.fromRGBO(44, 68, 100, 1), fontSize: 13.sp, fontWeight: FontWeight.bold),);
          }else if (value == 3){
            return  Text('BAC', style: TextStyle(color: const Color.fromRGBO(44, 68, 100, 1), fontSize: 13.sp, fontWeight: FontWeight.bold),);
          } else {
            return const Text('');
          }
        },)),
        leftTitles: AxisTitles( sideTitles: SideTitles(reservedSize:60.w, showTitles: true, getTitlesWidget: (value, meta){
          if (value == 0 ){
            return  Text("0.0 %", style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 1){
            return Text('10.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 2){
            return Text('20.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 3){
            return Text('30.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 4){
            return Text('40.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 5){
            return Text('50.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 6){
            return Text('60.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 7){
            return Text('70.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 8){
            return Text('80.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }else if (value == 9){
            return Text('90.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          }  else if (value == 10){
            return Text('100.0 %', style: GoogleFonts.raleway(color: myColors[4], fontSize: 15.sp, fontWeight: FontWeight.bold),);
          } else {
            return const Text('');
          }
        },))
        ),
        barGroups:barGroups
      )
    );
  }
}

