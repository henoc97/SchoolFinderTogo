
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../singleShoolFolder/single_school.dart';
import 'for_clip.dart';

class EcoleContainer extends StatefulWidget {
  const EcoleContainer({
    super.key,
    required this.size,
    required this.myModel,
    required this.myColors,
    required this.index,
  });

  final Size size;
  final List myModel;
  final List<Color> myColors;
  final int index;

  @override
  State<EcoleContainer> createState() => _EcoleContainerState();
}

class _EcoleContainerState extends State<EcoleContainer> {
  int moreInfo = 0;
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    return GestureDetector(
      onTap: () {
        
              Navigator.push(context, PageRouteBuilder(
        pageBuilder:  (_, __, ___) =>SingleSchool(index: widget.index, myEcole: widget.myModel,)));
            },
      child: Column(
        children: [
          ClipPath(
            clipper: MyClip(),
            child: SizedBox(height: widget.size.height*.22.h,
            width: widget.size.width*.8.w,
              
              child: Center(child: Container( width: widget.size.width*.8.w,height: widget.size.height*.22.h,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, 
              image: AssetImage(widget.myModel[index].pic)),
                borderRadius: BorderRadius.circular(25)),)),
            ),
          ),
          Container(margin: const EdgeInsets.only(left: 15),
            width: widget.size.width*.7.w,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: widget.size.width*.55.w,
                      child: Text('${widget.myModel[widget.index].name}', 
                      style: GoogleFonts.raleway(fontSize: 16.sp, fontWeight: FontWeight.bold),)),
                      IconButton(onPressed: (){},
                        icon:  FaIcon(FontAwesomeIcons.mapLocationDot, color: widget.myColors[2],)),
                  ],
                ),
                Row(
                  children: [
                    Card(
                      child: SizedBox(width: widget.size.width*.7,//height: widget.size.height*.03.h,
                        child: Center(child: Text('  ${widget.myModel[widget.index].nivEduc} ', style: GoogleFonts.raleway(fontSize: 18,fontWeight: FontWeight.bold),))),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(margin: EdgeInsets.only(top:moreInfo%2==1?  10:0), 
                          width: widget.size.width*.7.w,height: widget.size.height*.05.h,
                          decoration:moreInfo%2==1? BoxDecoration(color: widget.myColors[2],
                          borderRadius: BorderRadius.circular(15)):const BoxDecoration(),
                          child: Center(child: Text('  ${widget.myModel[widget.index].cost} cfa',
                          style: GoogleFonts.raleway(fontSize:moreInfo%2==1? 15.sp:13.sp, 
                          fontWeight: FontWeight.bold, color:moreInfo%2==1? widget.myColors[0]:widget.myColors[1]),))),
                      ],
                    ),
                if (moreInfo%2==1) SizedBox(height: widget.size.height*.18.h,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                    children: [
                      Text('  ${widget.myModel[widget.index].typeEts} ', 
                      style: GoogleFonts.raleway(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                    ],
                  ),
                    Text('Programmes :', style: GoogleFonts.ptSerifCaption(color: widget.myColors[1], 
                      fontWeight: FontWeight.bold,fontSize: 16.sp)),
                  Row(
                    children: [
                      Container(decoration: BoxDecoration(color: widget.myColors[4], borderRadius: BorderRadius.circular(15)),
                        width:widget.size.width*.7.w,
                       // height: widget.size.height*.06.h,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('  ${widget.myModel[widget.index].program}', style: GoogleFonts.raleway(
                              fontSize: 16.sp,fontWeight: FontWeight.bold,
                              color: widget.myColors[6]),),
                          ),
                        )),
                    ],
                  ),
                  
                
                ],),
                ) else Container(),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {
                      setState(() {
                        moreInfo++;
                      });
                    },
                    icon:  FaIcon(moreInfo%2==0?FontAwesomeIcons.angleDown:FontAwesomeIcons.angleUp),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
