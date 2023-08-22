import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../colors/colorsrepertory.dart';
import 'ecole_container.dart';
import 'for_ecole.dart';


class MoreEcole extends StatefulWidget {
  const MoreEcole({super.key});

  @override
  State<MoreEcole> createState() => _MoreEcoleState();
}

class _MoreEcoleState extends State<MoreEcole> {
  List<EcoleItems> myEcole = EcoleItems.getNewestItems();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color>myColors = ColorsRepertory().colorApp0;
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(onPressed: (){}, 
            icon:  Icon(Icons.more_vert_outlined, size: 30.sp, color: myColors[2],)),
            Row(children: [
             // IconButton(onPressed: (){}, 
             // icon:  FaIcon(Icons.sunny, size: 30, color: myColors[3],), ),
              CircleAvatar(
                child: Container(height: size.height*.08.h,width: size.width*.07.w,
                  decoration: const BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/photos/avatar/7309681.jpg")), 
                  borderRadius: BorderRadius.all(Radius.circular(100))),),
              )
              ],)
          ],),
            Row(
              children: [
                Text(" Trouver la meilleure école",style: 
                GoogleFonts.dancingScript(fontSize: 30.sp,fontWeight: FontWeight.bold, color: myColors[4]),),
              ],
            ),
          
                Padding(padding:const EdgeInsets.fromLTRB(12.0,12.0,12.0,0),
                          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ecoles', style: GoogleFonts.ptSerifCaption(color: myColors[1], 
                            fontWeight: FontWeight.bold,fontSize: 18.sp)),
                            
                          ],
                          )
                          ,),
            Expanded(
              child: ListView.builder(
                      itemCount: myEcole.length,
                      itemBuilder: (context, index) {
                      return 
                      EcoleContainer(size: size, myModel: myEcole, myColors: myColors, index: index,);
                    },
                    ),
            )
            
          ],),)
      );
  }
}