import 'package:flutter/material.dart';

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 50.0);
    path.quadraticBezierTo(size.width - 70.0, size.height , size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width / 3.0, size.height - 32.0, 0, size.height);
    return path;
  }

  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}