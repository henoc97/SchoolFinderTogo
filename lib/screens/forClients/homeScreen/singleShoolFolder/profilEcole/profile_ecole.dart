import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class ProfilEcole extends StatelessWidget {
  const ProfilEcole({
    super.key,
    required this.p,
    required this.myColors,
  });

  final List<String> p;
  final List<Color> myColors;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for(int i = 0; i<5; i++)
      Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${p[i]} :",
                style: GoogleFonts.ptSerifCaption(color: myColors[4], fontSize: 16.sp),),
              ),
            ],
          ),
          Container(height: 100,)//a remplir avec des données 
        ],
      )
    ],);
  }
}

