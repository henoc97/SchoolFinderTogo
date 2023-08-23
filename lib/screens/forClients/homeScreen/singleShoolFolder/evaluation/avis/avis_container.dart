import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ratePercentInd/rating.dart';



class AvisContainer extends StatelessWidget {
  const AvisContainer({
    super.key,
    required this.myColors,
    required this.size,
  });

  final List<Color> myColors;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(backgroundColor: myColors[4],
                            child:Icon(Icons.person, color: myColors[6],),
                          ),
            Container(margin: const EdgeInsets.only(left: 10, right: 10),width: size.width*.37.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text("AMAVIGAN Hénoc", style: GoogleFonts.ptSerifCaption(fontWeight:FontWeight.bold, 
                color: myColors[4], fontSize: 17.sp),),
              ),
            ),
            const RatingWidgetStatic(rateCtr: 4,),//rate de tt le monde 
          ],
        ),
        const SingleChildScrollView(child: Text(
          "Veuillez noter que la distorsion de l'image peut ne pas toujours être souhaitable du point de vue esthétique. Si vous voulez absolument afficher l'intégralité de l'image sans déformation, vous devrez peut-être envisager de redimensionner vos images à l'avance pour qu'elles s'adaptent correctement à la taille du conteneur."))
      ],),
    );
  }
}

