
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colorsrepertory.dart';
import '../homeScreen/component/for_ecole.dart';
import '../homeScreen/singleShoolFolder/single_school.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color>myColors = ColorsRepertory().colorApp0;
    List<EcoleItems> myEcole = EcoleItems.getNewestItems();
    return Scaffold(
      body: Container(
        margin:  EdgeInsets.only(top: 15.h),
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
                Text(" Vos écoles favorites",style: GoogleFonts.dancingScript(fontSize: 28.sp,fontWeight: FontWeight.bold, color: myColors[4]),),
              ],
            ),
            Expanded(child: ListView.builder(
              itemCount: myEcole.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=> SingleSchool(index: index, myEcole: myEcole,)));// liste a modifier a l avenir, c est juste pour un test
                  },
                  child: Container(margin: const EdgeInsets.only(bottom: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Container(height: size.height*.12.h,width: size.width*.28.w,
                      decoration: BoxDecoration(color: myColors[5].withOpacity(0.7),
                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage(myEcole[index].pic)),
                      borderRadius: BorderRadius.circular(15),),),
                      Container(height: size.height*.12.h,width: size.width*.53.w,
                      decoration: BoxDecoration(color: myColors[5].withOpacity(0.7), borderRadius: BorderRadius.circular(15)),
                      child: SingleChildScrollView(
                        child: SizedBox(height: size.height*.13,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text(" ${myEcole[index].name}", style: GoogleFonts.dancingScript(fontSize: 20.sp,fontWeight: FontWeight.bold, color: myColors[4]),),
                            Text(" ${myEcole[index].nivEduc}", style: GoogleFonts.ptSerifCaption(fontSize: 13.sp,fontWeight: FontWeight.bold, color: myColors[4]),),
                            Text(" ${myEcole[index].cost}", style: GoogleFonts.ptSerifCaption(fontSize: 13.sp,fontWeight: FontWeight.bold, color: myColors[4]),),
                          ]),
                        ),
                      ),
                      ),
                    ],),
                  ),
                );
              },
            ),)
    ]),
    ));
  }
}
