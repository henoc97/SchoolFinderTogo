import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service/cubit/sign_log_controller_cubit.dart';
import '../menu/menu_page.dart';

class CenterLogin extends StatefulWidget {
  const CenterLogin({
    super.key,
    required this.myColors,
  });

  final List<Color> myColors;

  @override
  State<CenterLogin> createState() => _CenterLoginState();
}

class _CenterLoginState extends State<CenterLogin> {
  //final _formKey = GlobalKey<FormState>;
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int pwdVisibity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 300.h,
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
                controller: lastnameController,
                decoration: InputDecoration.collapsed(
                  hintText: "Prénom...",
                  hintStyle: GoogleFonts.ptSerifCaption(
                      color: Colors.grey, fontSize: 18),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
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
                    controller: passwordController,
                    obscureText:pwdVisibity%2==1?true:false ,
                    decoration: InputDecoration.collapsed(
                      hintText: "Mot de Passe...",
                      hintStyle: GoogleFonts.ptSerifCaption(
                          color: Colors.grey, fontSize: 18.sp),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Veuillez entrer le mot de passe';
                      }
                      return null;
                    },
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
                          child: Text("Sign up",
                              style: GoogleFonts.ptSerifCaption(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: widget.myColors[6]))))
                ],
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>const MenuMain()));
            },
            child: Container(
                width: 200.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: widget.myColors[4],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text("Log in ",
                        style: GoogleFonts.ptSerifCaption(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: widget.myColors[6])))),
          ),
        ],
      ),
    );
  }
}
