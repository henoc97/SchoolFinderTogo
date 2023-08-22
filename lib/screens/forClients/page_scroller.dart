import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors/colorsrepertory.dart';
import 'allSchoolLoc/all_school_loc_main_page.dart';
import 'favoritesPage/favorite_page.dart';
import 'homeScreen/home_main_screen.dart';


class PageScroller extends StatefulWidget {
  const PageScroller({super.key});

  @override
  State<PageScroller> createState() => _PageScrollerState();
}

class _PageScrollerState extends State<PageScroller> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _index=2 ;
  @override
  Widget build(BuildContext context) {
    
    List<Color>myColors = ColorsRepertory().colorApp0;

    return  Scaffold(
      backgroundColor: myColors[0],
      bottomNavigationBar: CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: myColors[6],
      color : myColors[1],
      buttonBackgroundColor: myColors[2],
      index: _index,
      height : 40.h,
      animationCurve:Curves.fastOutSlowIn,
      items: <Widget>[
      FaIcon(FontAwesomeIcons.bell, color: myColors[6],),
      FaIcon(FontAwesomeIcons.circleInfo, color: myColors[6],),
      FaIcon(FontAwesomeIcons.house, color: myColors[6],),
      Icon(Icons.thumb_up, color: myColors[6],), 
      Icon(Icons.maps_ugc, color: myColors[6],), 

    ],
    onTap: (index) {
      //Handle button tap
      setState(() {
        _index = index;
      });
    },
  ),
  body: _index==2? const HomeMainScreen():
  _index==3?const FavoritesPage():
  _index==4?const AllSchoolMainLoc(): Container(),
  );
  }
}