import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';




class CirclePercentInd extends StatefulWidget {
  const CirclePercentInd({super.key});

  @override
  State<CirclePercentInd> createState() => _CirclePercentIndState();
}

class _CirclePercentIndState extends State<CirclePercentInd> {
  @override
  Widget build(BuildContext context) {
    
    return CircularPercentIndicator(
                radius: 80,
                lineWidth: 18.0,
                animation: true,
                animationDuration:2000,
                percent: 0.7,
                center:  Row(
                  children: [
                    Text(
                      "         3.5  ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                    const FaIcon(FontAwesomeIcons.star,)
                  ],
                ),
                
                circularStrokeCap: CircularStrokeCap.round,
                linearGradient : const LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [Colors.blue, Color.fromRGBO(70, 184, 209, 1) ,],),
              );
  }
}