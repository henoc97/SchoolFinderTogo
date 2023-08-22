import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../colors/colorsrepertory.dart';
import '../../../service/cubit/sign_log_controller_cubit.dart';
import 'center_login.dart';
import 'center_sign.dart';

class SignUpLogin extends StatefulWidget {
  const SignUpLogin({super.key});

  @override
  State<SignUpLogin> createState() => _SignUpLoginState();
}

class _SignUpLoginState extends State<SignUpLogin> {
  String header = '';
  int headerIndex = 0;
  int signLog = 0;

  final String targetheader = 'School Finder TOGO !  ';

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
    List<Color> myColors = ColorsRepertory().colorApp0;
    return Scaffold(
      body: Wrap(
        children: [
          Stack(
            children: [
              Center(
                  child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 40,),
                      child: Text(
                        header,
                        style: GoogleFonts.dancingScript(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: myColors[1]),
                      )),
                  Lottie.asset(
                    "assets/photos/lottie/signLog.json",
                    height: 470.h,
                    fit: BoxFit.fill,
                  ),
                ],
              )),
              BlocBuilder<SignLogControllerCubit, int>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.only(top:state%2==0? 180.h:120.h),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Center(
                          child: state % 2 == 0
                              ? CenterLogin(myColors: myColors)
                              : CenterSign(myColors: myColors)),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
