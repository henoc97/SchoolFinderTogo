import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../colors/colorsrepertory.dart';


class AllSchoolMainLoc extends StatefulWidget {
  const AllSchoolMainLoc({super.key});

  @override
  State<AllSchoolMainLoc> createState() => _AllSchoolMainLocState();
}

class _AllSchoolMainLocState extends State<AllSchoolMainLoc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color>myColors = ColorsRepertory().colorApp0;
    
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(onPressed: (){}, 
            icon:  Icon(Icons.more_vert_outlined, size: 30, color: myColors[2],)),
            Row(children: [
             // IconButton(onPressed: (){}, 
             // icon:  FaIcon(Icons.sunny, size: 30, color: myColors[3],), ),
              CircleAvatar(
                child: Container(height: size.height*.1,width: size.width*.1,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/photos/avatar/7309681.jpg")), 
                  borderRadius: BorderRadius.all(Radius.circular(100))),),
              )
              ],)
          ],),
            Row(
              children: [
                Text(" Localiser les écoles",style: GoogleFonts.dancingScript(fontSize: 32,fontWeight: FontWeight.bold, color: myColors[4]),),
              ],
            ),
            Container(margin: const EdgeInsets.only(bottom: 8, top: 12),
        decoration: BoxDecoration(border: Border.all(color: myColors[2], width: 1.5, style: BorderStyle.solid), color: myColors[6], borderRadius: BorderRadius.circular(15)),
              height: size.height*.07,width: size.width*.9,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(margin: const EdgeInsets.only(left: 20),
                    width: size.width*.5,
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(hintText: 'Recherche',
                      hintStyle: GoogleFonts.ptSerifCaption(color: Colors.grey, fontSize: 18),),
                    ),
                  ),
                Container(margin: const EdgeInsets.only(right: 3.5),
                  height: size.height*.06,
                  width: size.width*.2,
                  decoration: BoxDecoration(color:myColors[2], borderRadius: BorderRadius.circular(15)),
                  child: Icon(Icons.search, size: 30, color: myColors[6],)
                ),
        ]),
      ),
      Expanded(child : Center(child: Lottie.asset('assets/photos/lottie/mapWorld.json'),))
      ])),
    );
  }
}