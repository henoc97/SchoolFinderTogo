

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../colors/colorsrepertory.dart';
import 'ecole_container.dart';
import 'for_ecole.dart';
import 'sort_by_money_page.dart';


class SortCatego extends StatefulWidget {
  const SortCatego({super.key, required this.sortList, required this.sortName});
  final List<EcoleItems> sortList;
  final String sortName;
  @override
  State<SortCatego> createState() => _SortCategoState();
}

class _SortCategoState extends State<SortCatego> {
  
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
            icon:  Icon(Icons.more_vert_outlined, size: 27.sp, color: myColors[2],)),
            Row(children: [
             // IconButton(onPressed: (){}, 
             // icon:  FaIcon(Icons.sunny, size: 30, color: myColors[3],), ),
              CircleAvatar(
                child: Container(height: size.height*.1.h,width: size.width*.1.w,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/photos/avatar/7309681.jpg")), 
                  borderRadius: BorderRadius.all(Radius.circular(100))),),
              )
              ],)
          ],),
            Row(
              children: [
                SizedBox(width: size.width*.9,
                  child: Text(" Categories : ${widget.sortName}",style: GoogleFonts.dancingScript(fontSize: 28.sp,
                  fontWeight: FontWeight.bold, color: myColors[4]),)),
              ],
            ),
          
                Padding(padding:const EdgeInsets.fromLTRB(12.0,12.0,12.0,0),
                          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ecoles', style: GoogleFonts.ptSerifCaption(color: myColors[1], 
                            fontWeight: FontWeight.bold,fontSize: 18.sp)),
                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>SortByMoney(moneySort0: widget.sortList,)));
                                },
                                child: const Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.magnifyingGlass),
                                    FaIcon(FontAwesomeIcons.dollarSign),
                                  ],
                                ),
                              ),
                            )
                            
                          ],
                          )
                          ,),
            Expanded(
              child: widget.sortList.isEmpty?
              Center(child: Lottie.asset("assets/photos/lottie/no_result.json"),) 
              :ListView.builder(
                      itemCount: widget.sortList.length,
                      itemBuilder: (context, index) {
                      return 
                      EcoleContainer(size: size, myModel: widget.sortList, myColors: myColors, index: index,);
                    },
                    ),
            )
            
          ],),)
      );
  }
}