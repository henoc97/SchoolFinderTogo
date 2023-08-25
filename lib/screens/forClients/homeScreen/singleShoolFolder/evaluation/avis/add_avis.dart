import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolfindertogo/screens/forClients/homeScreen/singleShoolFolder/evaluation/ratePercentInd/rating.dart';

import '../../../../../../colors/colorsrepertory.dart';
import 'avis_container.dart';


class AddAvis extends StatefulWidget {
  const AddAvis({super.key});

  @override
  State<AddAvis> createState() => _AddAvisState();
}

class _AddAvisState extends State<AddAvis> {
  int rateCtr = 0;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color>myColors = ColorsRepertory().colorApp0;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                
                children: [
                  SizedBox(height: size.height*.86,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: size.width*.9,
                        decoration: BoxDecoration(color: myColors[5], borderRadius: BorderRadius.circular(10)),
                        child: AvisContainer(myColors: myColors, size: size),
                        ),
                      );
                    },
                    
                    ),
                  ),
                  Container(margin: const EdgeInsets.only(bottom: 8, top: 12),
                decoration: BoxDecoration(border: Border.all(color: myColors[2], width: 1.5, style: BorderStyle.solid), 
                color: myColors[6], borderRadius: BorderRadius.circular(15)),
                      height: size.height*.06.h,width: size.width*.9,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: size.width*.57.w,
                            child: TextFormField(
                              
                              decoration: InputDecoration.collapsed(hintText: 'Ajouter votre Avis',
                              hintStyle: GoogleFonts.ptSerifCaption(color: Colors.grey, fontSize: 18),),
                            ),
                          ),
                        GestureDetector(
                          onTap: () {
                                setState(() {
                                  rateCtr = 1;
                                });
                              },
                          child: Container(margin: const EdgeInsets.only(right: 3.5),
                            height: size.height*.05.h,
                            width: size.width*.13.w,
                            decoration: BoxDecoration(color:myColors[2], borderRadius: BorderRadius.circular(15)),
                            child: Icon(Icons.star_border, size: 30, color: myColors[6],)
                          ),
                        ),
                ],
              ),
                )]),
            ),
            Center(
              child: rateCtr==1? Container(margin: const EdgeInsets.only(right: 3.5),
                            height: size.height*.16.h,
                            width: size.width*.6.w,
                            decoration: BoxDecoration(color:myColors[0], borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(" Noter l'école", style: GoogleFonts.dancingScript(fontSize: 22.sp,fontWeight: FontWeight.bold, color: myColors[4]),),
                                    ],
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 10, bottom: 10), child: const RatingWidget()),
                                  Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            rateCtr = 0;
                                          });
                                        },
                                        child: Container(width: 50.w,
                                        decoration: BoxDecoration(color: myColors[7].withOpacity(0.3), borderRadius: BorderRadius.circular(5)),
                                          child: Center(child: Text("OK", style: GoogleFonts.dancingScript(fontSize: 22.sp,fontWeight: FontWeight.bold, color: myColors[7]),))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ):Container(),
            ),
          ],
        ),
      ));
  }
}