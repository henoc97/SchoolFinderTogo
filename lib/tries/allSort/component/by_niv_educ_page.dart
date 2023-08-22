import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colorsrepertory.dart';
import '../../../screens/forClients/homeScreen/component/for_categorise.dart';

class ByNivEducPage extends StatefulWidget {
  const ByNivEducPage({super.key});

  @override
  State<ByNivEducPage> createState() => _ByNivEducPageState();
}

class _ByNivEducPageState extends State<ByNivEducPage> {
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
                Text(" Trouver l' ecole de votre choix ",style: GoogleFonts.dancingScript(fontSize: 32,fontWeight: FontWeight.bold, color: myColors[4]),),
              ],
            ),
          
                Padding(padding:const EdgeInsets.fromLTRB(12.0,12.0,12.0,0),
                          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ecoles', style: GoogleFonts.ptSerifCaption(color: myColors[1], 
                            fontWeight: FontWeight.bold,fontSize: 20)),
                            
                          ],
                          )
                          ,),
            SizedBox(
              height: size.height*.15,
              child: 
            CategoriesShower(size: size),)
            
          ],),)
      );
  }
}