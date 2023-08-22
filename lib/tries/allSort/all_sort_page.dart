import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/colorsrepertory.dart';
import '../../screens/forClients/homeScreen/component/for_categorise.dart';


class EachCategories{
  final String name;
  final IconData icon;
  const EachCategories({required this.name, required this.icon});
  static List<EachCategories> getCategoryList(){
    List <EachCategories> itemList = <EachCategories> [];
      itemList.add(const EachCategories(name: "Niveau d' éducation", icon: FontAwesomeIcons.arrowTurnUp));
      itemList.add(const EachCategories(name: "Types d' établissement", icon: FontAwesomeIcons.school));
      itemList.add(const EachCategories(name: "Progammes éducatifs", icon: FontAwesomeIcons.servicestack));
      itemList.add(const EachCategories(name: "Localisation", icon: FontAwesomeIcons.locationDot));
      itemList.add(const EachCategories(name: "Classement par avis", icon: FontAwesomeIcons.rankingStar));
    return itemList;
  }
}

class AllSortPage extends StatefulWidget {
  const AllSortPage({super.key});

  @override
  State<AllSortPage> createState() => _AllSortPageState();
}

class _AllSortPageState extends State<AllSortPage> {
  int upDown = -1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<EachCategories> itemsList = EachCategories.getCategoryList();
    List<Color>myColors = ColorsRepertory().colorApp0;
  
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(onPressed: (){}, 
            icon:  Icon(Icons.more_vert_outlined, size: 30, color: myColors[2],)),
            Row(children: [
             // IconButton(onPressed: (){}, 
             // icon:  FaIcon(Icons.sunny, size: 30, color: myColors[3],), ),
              CircleAvatar(
                child: Container(height: size.height*.1,width: size.width*.1,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/photos/avatar/7309681.jpg")), 
                  borderRadius: BorderRadius.all(Radius.circular(100))),),
              )
              ],)
          ],),
            Row(
              children: [
                Text(" Trouver l' ecole de votre choix ",style: GoogleFonts.dancingScript(fontSize: 32,fontWeight: FontWeight.bold, color: myColors[4]),),
              ],
            ),
          
                Padding(padding:const EdgeInsets.fromLTRB(12.0,12.0,12.0,0),
                          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ecoles', style: GoogleFonts.ptSerifCaption(color: myColors[1], 
                            fontWeight: FontWeight.bold,fontSize: 20)),
                            
                          ],
                          )
                          ,),
            Expanded(
              child: ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      
                    },
                    child: SortUnderGround(index: index, itemsList: itemsList, myColors: myColors, size: size,)
                  );
                },
              )
            )
            
          ],),)
      );
  }
}

class SortUnderGround extends StatefulWidget {
  const SortUnderGround({super.key,
    required this.size,
    required this.itemsList,
    required this.myColors,
    required this.index,});

  final Size size;
  final List<EachCategories> itemsList; 
  final List<Color> myColors;
  final int index;


  @override
  State<SortUnderGround> createState() => _SortUnderGroundState();
}

class _SortUnderGroundState extends State<SortUnderGround> {
  int upDown = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
                        children: [
                          Container(margin: const EdgeInsets.only(bottom: 10),
                            height: widget.size.height*.1,
                            decoration: BoxDecoration(color: widget.myColors[widget.index%4+2],
                              borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                SizedBox(width: widget.size.width*.2,
                                child: Center(child: FaIcon(widget.itemsList[widget.index].icon, color:widget.index==0||widget.index==widget.itemsList.length-1? widget.myColors[4]: widget.myColors[2],)),),
                                SizedBox(width: widget.size.width*.7,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(widget.itemsList[widget.index].name,
                                      style: GoogleFonts.ptSerifCaption(color: widget.myColors[0], 
                                        fontWeight: FontWeight.bold,fontSize: 20)),
                                      Padding(
                                    padding: const EdgeInsets.all(8),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        upDown++;
                                      });
                                    },
                                    child: Center(child:FaIcon(upDown%2==0? FontAwesomeIcons.angleDown: FontAwesomeIcons.angleUp,
                                    color:widget.index==0||widget.index==widget.itemsList.length-1? widget.myColors[4]: widget.myColors[2],)),
                                  ),),
                                  
                                    ],
                                  ),
                                ),
                                
                              ]),
                              ),
                              Container(margin: const EdgeInsets.only(bottom: 10),
                              child: upDown%2==0? CategoriesShower(size: widget.size):Container(),
                              )
                        ],
                      );
  }
}