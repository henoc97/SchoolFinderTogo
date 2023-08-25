import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../colors/colorsrepertory.dart';
import '../component/for_clip.dart';
import 'carte/small_map.dart';
import 'evaluation/evaluation.dart';
import 'profilEcole/profile_ecole.dart';




class SingleSchool extends StatefulWidget {
  const SingleSchool({super.key, required this.index, required this.myEcole});

  final int index;
  final List myEcole;

  @override
  State<SingleSchool> createState() => _SingleSchoolState();
}

class _SingleSchoolState extends State<SingleSchool> {
  List <String> t = ["Profil", "Evaluation", "Carte"];
  List <String> p = ["Coordonnées", "Programmes offerts", "Frais de scolarité", "Activités parascolaires", "installation"];
  int elevationCtr = 0;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color>myColors = ColorsRepertory().colorApp0;
    List myEcole = widget.myEcole;
    return Scaffold(
      body: Column(children: [
        Flexible(flex: 2,
          child: ClipPath(
            clipper: MyClip(),
            child: Center(child: Container( 
            decoration: BoxDecoration(image:  DecorationImage(fit: BoxFit.fill, 
            image: AssetImage(myEcole[widget.index].pic)),
              borderRadius: BorderRadius.circular(5)),)),
          ),),
        Flexible(flex: 3,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Académie Éclatante', style: GoogleFonts.ptSerifCaption(color: myColors[4], fontSize: 16.sp),),
                CircleAvatar(backgroundColor: myColors[4],
                  child: IconButton(onPressed: (){}, 
                  icon: Icon(Icons.thumb_up, color: myColors[6],),),
                )
              ],)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                for(int i = 0; i<3; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      elevationCtr=i;
                    });
                  },
                  child: Card(elevation:elevationCtr==i? 30:1,
                    child: SizedBox(height:size.height*.045.h,
                  child: Center(child: Text("  ${t[i]}  ",
                  style: GoogleFonts.ptSerifCaption(fontWeight:elevationCtr==i? FontWeight.bold:FontWeight.normal, color: myColors[4], fontSize: 16.sp),
                  )))),
                )
              ],),
            ),
            Expanded(child: SingleChildScrollView(child: elevationCtr==0?ProfilEcole(myColors: myColors, p: p,):
            elevationCtr==1?Evaluation(myColors: myColors, size: size):
            Carte(size: size, myColors: myColors),))
          ],))
      ],),
    );
  }
}

