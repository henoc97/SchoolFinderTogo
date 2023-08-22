import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colorsrepertory.dart';


class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color>myColors = ColorsRepertory().colorApp0;
    
    return Scaffold(
      body: Container(
        margin:  EdgeInsets.only(top: 20.h),
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
                  decoration: const BoxDecoration(image: DecorationImage(
                    image: AssetImage("assets/photos/avatar/7309681.jpg")), 
                  borderRadius: BorderRadius.all(Radius.circular(100))),),
              )
              ],)
          ],),
            Row(
              children: [
                Text(" Rechercher la meilleure école",style: GoogleFonts.dancingScript(
                  fontSize: 30.sp,fontWeight: FontWeight.bold, color: myColors[4]),),
              ],
            ),
            Container(margin:  EdgeInsets.only(bottom: 7.h, top: 10.h),
        decoration: BoxDecoration(border: Border.all(color: myColors[2], width: 1.5, style: BorderStyle.solid), 
        color: myColors[6], borderRadius: BorderRadius.circular(15)),
              height: size.height*.06.h,width: size.width*.9.w,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(margin: const EdgeInsets.only(left: 20),
                    width: size.width*.5.w,
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(hintText: 'Recherche',
                      hintStyle: GoogleFonts.ptSerifCaption(color: Colors.grey, fontSize: 17.sp),),
                    ),
                  ),
                Container(margin: const EdgeInsets.only(right: 3.5),
                  height: size.height*.05.h,
                  width: size.width*.17.w,
                  decoration: BoxDecoration(color:myColors[2], borderRadius: BorderRadius.circular(15)),
                  child: Icon(Icons.search, size: 28.sp, color: myColors[6],)
                ),
        ]),
      )])),
    );
  }
}