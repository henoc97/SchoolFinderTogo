import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../colors/colorsrepertory.dart';



class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int rateCtr = 0;
  @override
  Widget build(BuildContext context) {
    List<Color>myColors = ColorsRepertory().colorApp0;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rateCtr=1;
                          });
                        },
                        child:rateCtr == 1||rateCtr == 2||rateCtr == 3||rateCtr == 4||rateCtr == 5?
                        FaIcon(Icons.star, color: myColors[2],) : const FaIcon(FontAwesomeIcons.star,)),
                        GestureDetector(
                        onTap: () {
                          setState(() {
                            rateCtr=2;
                          });
                        },
                        child:rateCtr == 2||rateCtr == 3||rateCtr == 4||rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) : const FaIcon(FontAwesomeIcons.star,)),
                        GestureDetector(
                        onTap: () {
                          setState(() {
                            rateCtr=3;
                          });
                        },
                        child:rateCtr == 3||rateCtr == 4||rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) :const FaIcon(FontAwesomeIcons.star,)),
                        GestureDetector(
                        onTap: () {
                          setState(() {
                            rateCtr=4;
                          });
                        },
                        child: rateCtr == 4||rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) :const FaIcon(FontAwesomeIcons.star,)),
                        GestureDetector(
                        onTap: () {
                          setState(() {
                            rateCtr=5;
                          });
                        },
                        child: rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) :const FaIcon(FontAwesomeIcons.star,))
                    ],);
  }
}


class RatingWidgetStatic extends StatefulWidget {
  const RatingWidgetStatic({super.key, required this.rateCtr});
  final int rateCtr;
  @override
  State<RatingWidgetStatic> createState() => _RatingWidgetStaticState();
}

class _RatingWidgetStaticState extends State<RatingWidgetStatic> {
  
  @override
  Widget build(BuildContext context) {
    List<Color>myColors = ColorsRepertory().colorApp0;
    int rateCtr = widget.rateCtr;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      rateCtr == 1||rateCtr == 2||rateCtr == 3||rateCtr == 4||rateCtr == 5?
                      FaIcon(Icons.star, color: myColors[2],) : const FaIcon(FontAwesomeIcons.star,),
                        rateCtr == 2||rateCtr == 3||rateCtr == 4||rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) : const FaIcon(FontAwesomeIcons.star,),
                        rateCtr == 3||rateCtr == 4||rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) :const FaIcon(FontAwesomeIcons.star,),
                        rateCtr == 4||rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) :const FaIcon(FontAwesomeIcons.star,),
                        rateCtr == 5?FaIcon(Icons.star, color: myColors[2],) :const FaIcon(FontAwesomeIcons.star,)
                    ],);
  }
}