import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/cubit/sign_log_controller_cubit.dart';

class CenterSign extends StatefulWidget {
  const CenterSign({
    super.key,
    required this.myColors,
  });

  final List<Color> myColors;

  @override
  State<CenterSign> createState() => _CenterSignState();
}

class _CenterSignState extends State<CenterSign> {
  TextEditingController fristnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPwController = TextEditingController();
  int pwdVisibity = 1;
  int pwdVisibity1 = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 450.h,
      decoration: BoxDecoration(
          color: widget.myColors[2].withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 300.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Container(
              margin: const EdgeInsets.only(top: 13, left: 13),
              child: TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: "Nom...",
                  hintStyle: GoogleFonts.ptSerifCaption(
                      color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            width: 300.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Container(
              margin: const EdgeInsets.only(top: 13, left: 13),
              child: TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: "Prénom...",
                  hintStyle: GoogleFonts.ptSerifCaption(
                      color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            width: 300.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Container(
              margin: const EdgeInsets.only(top: 13, left: 13),
              child: TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: "Contact...",
                  hintStyle: GoogleFonts.ptSerifCaption(
                      color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            width: 300.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 13, left: 13),
                  width: 220.w,
                  child: TextFormField(
                    obscureText:pwdVisibity%2==0?false:true ,
                    decoration: InputDecoration.collapsed(
                      hintText: "Mot de Passe...",
                      hintStyle: GoogleFonts.ptSerifCaption(
                          color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                IconButton(
                    iconSize: 25.sp,
                    onPressed: () {
                      setState(() {
                        pwdVisibity++;
                      });
                    },
                    icon: Icon(pwdVisibity % 2 == 0
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined))
              ],
            ),
          ),
          Container(
            width: 300.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 13, left: 13),
                  width: 220.w,
                  child: TextFormField(
                    obscureText:pwdVisibity1%2==1?true:false ,
                    decoration: InputDecoration.collapsed(
                      hintText: "Confirmer le Mot de Passe...",
                      hintStyle: GoogleFonts.ptSerifCaption(
                          color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                IconButton(
                    iconSize: 25.sp,
                    onPressed: () {
                      setState(() {
                        pwdVisibity1++;
                      });
                    },
                    icon: Icon(pwdVisibity1 % 2 == 0
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined))
              ],
            ),
          ),
          BlocBuilder<SignLogControllerCubit, int>(
            builder: (context, state) {
              return Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          context.read<SignLogControllerCubit>().increment();
                        },
                        child: Text("Log in",
                            style: GoogleFonts.ptSerifCaption(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: widget.myColors[6])),
                      ))
                ],
              );
            },
          ),
          Container(
              width: 220.w,
            height: 50.h,
              decoration: BoxDecoration(
                color: widget.myColors[4],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text("Sign up",
                      style: GoogleFonts.ptSerifCaption(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: widget.myColors[6])))),
        ],
      ),
    );
  }
}
