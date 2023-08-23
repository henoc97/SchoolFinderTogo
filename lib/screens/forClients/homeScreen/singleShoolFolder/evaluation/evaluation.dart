import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'avis/add_avis.dart';
import 'avis/avi_space.dart';
import 'bar/bar_chart_constructor.dart';
import 'ratePercentInd/circle_percent_ind.dart';
import 'ratePercentInd/horizontal_percent.dart';
import 'ratePercentInd/rating.dart';


class Evaluation extends StatelessWidget {
  const Evaluation({
    super.key,
    required this.size,
    required this.myColors,
  });

  final Size size;
  final List<Color> myColors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: size.height*.28.h,width: size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CirclePercentInd(),
                Column(children: [
                  for(int i=5; i>0; i--)
                  Row(children: [
                    Row(children: [
                      Text("  $i ", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),),
                      const FaIcon(FontAwesomeIcons.star)
                    ],),
                    HorizontalPercent(index: i,)
                  ],)
                ],)
              ],
            )),
          SizedBox( width: size.width*.5.w,
            child: const RatingWidget()
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: const EdgeInsets.only(bottom:5, top: 25),
                child: Text('Avis', style: GoogleFonts.ptSerifCaption(color: myColors[4], fontSize: 16.sp),)),
              IconButton(onPressed: (){
                Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>const AddAvis()));
              }, 
              icon: const FaIcon(FontAwesomeIcons.penToSquare))
            ],
          ),
          Container(height: size.height*.34.h,width: size.width,
            decoration: BoxDecoration(color: myColors[5], borderRadius: BorderRadius.circular(15)),
            child: AvisSpace(size: size, myColors: myColors),
            ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: const EdgeInsets.only(bottom: 30, top: 25),
                child: Text('Taux de réussite : ', style: GoogleFonts.ptSerifCaption(color: myColors[4], fontSize: 16.sp),)),
              IconButton(onPressed: (){}, 
              icon: FaIcon(FontAwesomeIcons.arrowRight, color: myColors[4],))
            ],
          ),
          SizedBox(height: size.height*.36.h,width: size.width,
            child: ShowBarChart()),
        ],
      ),
    );
  }
}
