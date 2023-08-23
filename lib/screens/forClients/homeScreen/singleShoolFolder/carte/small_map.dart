import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Carte extends StatelessWidget {
  const Carte({
    super.key,
    required this.myColors,
    required this.size,
  });

  final List<Color> myColors;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Coordonnées :",
        style: GoogleFonts.ptSerifCaption(color: myColors[4], fontSize: 16.sp),),
      ),
    ],
          ),
          Container(height: size.height*.3.h,width: size.width*.9,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Card(elevation: 30,
    child: Column(children: [
      Flexible(flex: 3, child: Container(decoration: BoxDecoration(borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15)),color: myColors[4],))),
      Flexible(child: Container(decoration: BoxDecoration(borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15)
      ),color: myColors[0],)))
    ]),
          ),
          ),
          
          ]);
  }
}
