import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colorsrepertory.dart';
import '../../../tries/allSort/all_sort_page.dart';
import 'component/for_categorise.dart';
import 'component/for_ecole.dart';
import 'component/for_promotion.dart';
import 'component/more_ecole.dart';
import 'home_search.dart';


class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  
  int index=2 ;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    List<Color>myColors = ColorsRepertory().colorApp0;

    return SizedBox(height: size.height.h,
      child: Stack(
        children: [
          Container(height: size.height*.2.h,width: size.width.w,
          decoration: BoxDecoration(color: myColors[1], borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)
          )),
          child: Container(
            margin:  EdgeInsets.only(top: 20.h),
            padding:  EdgeInsets.all(8.0.h),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                IconButton(onPressed: (){}, 
                icon:  Icon(Icons.more_vert_outlined, size: 30.sp, color: myColors[2],)),
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
                    Text(" Bienvenu Hénoc",style: GoogleFonts.dancingScript(fontSize: 30.sp,
                    fontWeight: FontWeight.bold, color: myColors[6]),),
                  ],
                ),
            ]),
          ),),
          Container(margin: EdgeInsets.only(top: size.height*.150.h,),
          
            child: SingleChildScrollView(
              child: Column(
                children: [
                Container(margin:  EdgeInsets.only(top: 10.h),
                  child: PromotionShower(size: size, myColors: myColors,) //PromotionShower
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=> const HomeSearch()));
                  },
                  child: Container(margin:  EdgeInsets.only(bottom: 8.h, top: 12.h),
                      decoration: BoxDecoration(border: Border.all(color: myColors[2], width: 1.5, style: BorderStyle.solid), 
                      color: myColors[6], borderRadius: BorderRadius.circular(15)),
                            height: size.height*.06.h,width: size.width*.8.w,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('    Recherche',style: 
                              GoogleFonts.ptSerifCaption(color: Colors.grey, fontSize: 18.sp),),
                              Container(margin: const EdgeInsets.only(right: 3.5),
                                height: size.height*.05.h,
                                width: size.width*.18.w,
                                decoration: BoxDecoration(color:myColors[2], borderRadius: BorderRadius.circular(15)),
                                child: Icon(Icons.search, size: 30.sp, color: myColors[6],)
                              ),
                          ],
                        ),
                      ),
                ),
      SingleChildScrollView(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(8.0.w,),
            child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Catégories', style: GoogleFonts.ptSerifCaption(color: myColors[1], 
              fontWeight: FontWeight.bold,fontSize: 18.sp)),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>const AllSortPage()));
                },
                child: Text('tri avancé', style: GoogleFonts.ptSerifCaption(color: myColors[1], 
                fontWeight: FontWeight.bold,fontSize: 13.sp)),
              ),
              ],
            )
            ,),
            CategoriesShower(size: size),
            Padding(padding: EdgeInsets.fromLTRB(12.0.w,12.0.h,12.0.w,0),
            child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ecoles', style: GoogleFonts.ptSerifCaption(color: myColors[1], 
              fontWeight: FontWeight.bold,fontSize: 18.sp)),
              TextButton(
              onPressed: (){
                Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___)=>const MoreEcole()));
              },
              child: Text('plus', style: GoogleFonts.ptSerifCaption(color: myColors[4], 
              fontWeight: FontWeight.bold,fontSize: 13.sp)),
              ),
            ],
            )
            ,),
            SizedBox(height: size.height*.43.h,
              child: EcoleShower(size: size))
            
          ],),)
                ],
              ),
            ),
          )],
      ),
    );
  }
}

