import 'package:flutter/material.dart';
import 'avis_container.dart';



class AvisSpace extends StatelessWidget {
  const AvisSpace({
    super.key,
    required this.size,
    required this.myColors,
  });

  final Size size;
  final List<Color> myColors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(height: size.height*.15,width: size.width*.9,
        decoration: BoxDecoration(color: myColors[6], borderRadius: BorderRadius.circular(10)),
        child: AvisContainer(myColors: myColors, size: size),
        ),
      );
    },
    
    );
  }
}
