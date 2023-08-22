import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../colors/colorsrepertory.dart';



class TauxDeRessBigPage extends StatefulWidget {
  const TauxDeRessBigPage({super.key});

  @override
  State<TauxDeRessBigPage> createState() => _TauxDeRessBigPageState();
}

class _TauxDeRessBigPageState extends State<TauxDeRessBigPage> {
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
                Text(" Vos écoles favorites",style: GoogleFonts.dancingScript(fontSize: 32,fontWeight: FontWeight.bold, color: myColors[4]),),
              ],
            ),
            
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Row(children: [
                  SizedBox(height: size.height*.4,width: size.width,),
                  SizedBox(height: size.height*.4,width: size.width,),
                ],);
              },
            ),
    ]),
    ));
  }
}