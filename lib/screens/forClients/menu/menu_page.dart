import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolfindertogo/screens/forClients/page_scroller.dart';
import 'package:schoolfindertogo/service/cubit/menu_ctlr_cubit.dart';

import '../../../colors/colorsrepertory.dart';

class MenuItems{
  final String title;
  final IconData icon;
  const MenuItems({required this.title, required this.icon});

  static List<MenuItems> getMenuItems(){
    List<MenuItems> menuItems = <MenuItems>[];

    menuItems.add(const MenuItems(title: 'Evènement et Promotion', icon: Icons.event_available_outlined));
    menuItems.add(const MenuItems(title: "Catégories", icon: Icons.category_outlined));
    menuItems.add(const MenuItems(title: "CArte", icon: FontAwesomeIcons.mapLocation));
    menuItems.add(const MenuItems(title: "FeedBack", icon: Icons.feedback));
    menuItems.add(const MenuItems(title: 'Notez nous', icon: FontAwesomeIcons.star));
    menuItems.add(const MenuItems(title: "A propos", icon: FontAwesomeIcons.universalAccess));
    menuItems.add(const MenuItems(title: "Contactez nous", icon: FontAwesomeIcons.phone));

    return menuItems;
  }
}

class MenuMain extends StatefulWidget {
  const MenuMain({super.key});

  @override
  State<MenuMain> createState() => _MenuMainState();
}

class _MenuMainState extends State<MenuMain> {
  String header = '';
  int headerIndex = 0;
  int signLog = 0;
  double value = 0;

  final String targetheader = 'School Finder TOGO ';

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() async {
    for (int i = 0; i < targetheader.length; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        headerIndex = i;
        header = targetheader.substring(0, headerIndex + 1);
      });
      if (i == targetheader.length - 1) {
        setState(() {
          i = 0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color> myColors = ColorsRepertory().colorApp0;
    List<MenuItems> menuItems = MenuItems.getMenuItems();
    return BlocProvider(
      create: (context) => MenuCtlrCubit(),
      child: Scaffold(
        body: BlocBuilder<MenuCtlrCubit, double>(
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [myColors[4], myColors[2]],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                SafeArea(
                    child: Container(
                  width: size.width * .57,
                  child: ListView(children: [
                    DrawerHeader(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('assets/photos/promotion/2.jpg')),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          header,
                          style: GoogleFonts.dancingScript(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: myColors[0]),
                        )
                      ],
                    )),
                    Column(
                      children: [
                        for (int i = 0; i < 7; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                onTap: () {},
                                leading: Icon(
                                  menuItems[i].icon,
                                  color: myColors[0],
                                  size: 27.sp,
                                ),
                                title: Text(
                                  menuItems[i].title,
                                  style: GoogleFonts.ptSerifCaption(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: myColors[0]),
                                )),
                          )
                      ],
                    )
                  ]),
                )),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: state),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    builder: (_, double val, ___) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0025)
                          ..setEntry(0, 3, 190 * val)
                          ..rotateY((pi / 6) * val),
                        child: const PageScroller(),
                      );
                    }),
              state==1? GestureDetector(onHorizontalDragUpdate: (details) {
                  if (details.delta.dx< 0) {
                    context.read<MenuCtlrCubit>().sateZero();
                    } 
                }): Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
