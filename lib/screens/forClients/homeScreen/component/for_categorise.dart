
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../colors/colorsrepertory.dart';
import '../../../../tries/sort_by_niv_educ.dart';
import 'sort_by_categ_page.dart';


class CategoryItems{
  Color backColor;
  Color iconColor;
  String name;

  CategoryItems({required this.name, required this.backColor, required this.iconColor});

  static List<CategoryItems> getCategoryItems(){
    List<CategoryItems> itemsList = <CategoryItems>[];

    itemsList.add(CategoryItems(name: "Maternelle", backColor:  const Color.fromARGB(186, 124, 154, 229), iconColor: const Color.fromARGB(255, 4, 1, 59),));  
    itemsList.add(CategoryItems(name: "Primaire", backColor: const Color.fromRGBO(70, 184, 209, 1) ,iconColor: const Color.fromARGB(255, 4, 1, 59)));
    itemsList.add(CategoryItems(name: "Collège", backColor:const Color.fromRGBO(44, 68, 100, 1),iconColor:const Color.fromRGBO(70, 184, 209, 1)));
    itemsList.add(CategoryItems(name: "Moderne / Générale", backColor:const Color.fromARGB(186, 124, 154, 229), iconColor: const Color.fromARGB(255, 4, 1, 59))); 
    itemsList.add(CategoryItems(name: "Technique / Professionnelle", backColor: const Color.fromRGBO(10, 43, 78, 1),iconColor:const Color.fromRGBO(70, 184, 209, 1)));
    itemsList.add(CategoryItems(name: "Lycée", backColor: const Color.fromRGBO(70, 184, 209, 1) ,iconColor: const Color.fromARGB(255, 4, 1, 59)));
    itemsList.add(CategoryItems(name: "Publique", backColor: const Color.fromRGBO(44, 68, 100, 1),iconColor:const Color.fromRGBO(70, 184, 209, 1)));
    itemsList.add(CategoryItems(name: "Privée", backColor: const Color.fromRGBO(70, 184, 209, 1),iconColor: const Color.fromARGB(255, 4, 1, 59)));
    
    return itemsList;
  }
}




class CategoriesShower extends StatelessWidget {
  const CategoriesShower({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    List<Color>myColors = ColorsRepertory().colorApp0;
    
    List<CategoryItems> itemsList = CategoryItems.getCategoryItems();
    return SizedBox(height: size.height*.13.h,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        for(int i = 0; i<2; i++) 
        Row(children: [
          for(int y = 0; y<4; y++) 
          GestureDetector(
            onTap: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>SortCatego(
                sortList:CtgSort().ctgSort(i == 0?itemsList[y].name:itemsList[y+4].name,), 
                sortName: i == 0?itemsList[y].name:itemsList[y+4].name,
                
                )));
            },
            child: Container(height: size.height*.06.h,margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              decoration: BoxDecoration(color:i == 0? itemsList[y].backColor : itemsList[y+4].backColor, 
              borderRadius: BorderRadius.circular(15)),
            child:Row(
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaIcon(y%3==0?FontAwesomeIcons.school:FontAwesomeIcons.globe, 
                color:i == 0?itemsList[y].iconColor:itemsList[y+4].iconColor,),
              ),
              Text(i == 0?"  ${itemsList[y].name}  ":"  ${itemsList[y+4].name}  ", 
              style: GoogleFonts.ptSerifCaption(
                fontWeight: FontWeight.bold,
                
                color: myColors[6],fontSize: 14.sp),),
            ],),
            ),
          )
        ],)
      ],),
    ),
    );
  }
}
