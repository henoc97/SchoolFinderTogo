

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class PromotionList{
  PromotionList({required this.name, required this.motiv, required this.pic,required this.reduice});
  String name ;
  String motiv;
  String pic;
  int reduice;

  static List<PromotionList> getPromotionList(){
    List<PromotionList> itemsList =<PromotionList>[];
    itemsList.add(PromotionList(motiv: "Faire grandir les esprits curieux.",
    name: "École Lumina", pic: "assets/photos/promotion/1.jpg", reduice: 30));
    itemsList.add(PromotionList(motiv: "Nourrir la passion d'apprendre.",
    name: "Collège Étoile Brillante", pic: "assets/photos/promotion/2.jpg", reduice: 50));
    itemsList.add(PromotionList(motiv: "Élever des penseurs critiques.",
    name:"Lycée Horizon", pic: "assets/photos/promotion/3.jpg", reduice: 40));
    itemsList.add(PromotionList(motiv: "Préparer des citoyens du monde éclairés.",
    name: "École des Innovateurs", pic: "assets/photos/promotion/4.jpg", reduice: 25));
    itemsList.add(PromotionList(motiv: "Cultiver la confiance en soi.", 
    name: "Académie Arc-en-Ciel", pic: "assets/photos/promotion/5.jpg", reduice: 12));
    itemsList.add(PromotionList(motiv: "Offrir un lieu d'apprentissage .", 
    name: "École Renaissance", pic: "assets/photos/promotion/6.jpg", reduice: 12));

    return itemsList;
  }
}


class PromotionShower extends StatelessWidget {
  const PromotionShower({
    super.key,
    required this.size,
    required this.myColors,
  });

  final Size size;
  final List<Color> myColors;

  @override
  Widget build(BuildContext context) {
    List<PromotionList> myPromotionList = PromotionList.getPromotionList();
    return SizedBox(width: size.width,height: size.height*.170.h,
      child: ListView.builder(
        itemCount: myPromotionList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return 
        Container(margin: EdgeInsets.only(left: size.width*.12.h, right: size.width*.07.w,) ,
          child: Center(child: Container(height: size.height*.17.h, width: size.width*.65.w,
          decoration: BoxDecoration(color: myColors[1],
            image: DecorationImage(opacity: 0.5,
            fit: BoxFit.cover, image: AssetImage(myPromotionList[index].pic)), 
          borderRadius: BorderRadius.circular(25)),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                margin: const EdgeInsets.only(top:5, left: 5),
                width: size.width*.5.w,
                child:  Text(myPromotionList[index].name, 
                style: GoogleFonts.dancingScript(color: myColors[0], fontSize: 22.sp,
                fontWeight: FontWeight.bold),),),
                
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(width: size.width*.35.w,
                margin: const EdgeInsets.only(left:15),
                child:  Text(myPromotionList[index].motiv, 
                style: GoogleFonts.raleway(fontWeight: FontWeight.bold, color: myColors[0]))),
              Container(height: size.height*.04.h,width: size.width*.2.w,
                decoration: BoxDecoration(color: myColors[4], borderRadius: const BorderRadius.only(
                topLeft : Radius.circular(25),
                bottomRight: Radius.circular(25)
              )),
              child: Center(child:  Text('- ${myPromotionList[index].reduice} %',
              style: GoogleFonts.dancingScript(color: myColors[0], fontWeight: FontWeight.bold, fontSize: 16.sp),)),)
            ],)
          ]),
          )),
        );
      },
      ),
    );
  }
}

