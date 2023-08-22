import 'package:flutter/material.dart';
import '../../../../colors/colorsrepertory.dart';
import 'ecole_container.dart';

class EcoleItems{
  EcoleItems({required this.name, required this.cost, required this.pic,
  required this.program, required this.nivEduc, required this.typeEts});
  String name;
  String cost;
  String pic;
  String program;
  String nivEduc;
  String typeEts;

  static List<EcoleItems> getNewestItems(){
    List<EcoleItems> itemsList = <EcoleItems>[];

    itemsList.add(EcoleItems(name: "Académie Éclatante", cost: "35000/50000", pic: 'assets/photos/promotion/2.jpg',
    nivEduc: 'Maternelle/Primaire', program: 'linguistique/sportif', typeEts: 'École bilingue'));
    itemsList.add(EcoleItems(name: "Collège Avenir", cost: "75000", pic: 'assets/photos/newest/1.jpg',
    nivEduc: 'Collège', program: 'artistique/scientifique', typeEts: "École d'enseignement spécialisé"));
    itemsList.add(EcoleItems(name: "Lycée Étoile du Savoir", cost: "70000/90000", pic: 'assets/photos/newest/2.jpg',
    nivEduc: 'Collège/Lycée', program: 'général/technologique', typeEts: 'Lycée général'));
    itemsList.add(EcoleItems(name: "École des Explorateurs", cost: "20000/30000/45000", pic: 'assets/photos/newest/3.jpg',
    nivEduc: 'Maternelle/Primaire/Collège', program: 'sportif/sciences sociales', typeEts: 'École privée'));
    itemsList.add(EcoleItems(name: "Institut Créatif", cost: "15000", pic: 'assets/photos/newest/4.jpeg',
    nivEduc: 'Maternelle', program: 'linguistique/Sportif', typeEts: 'École bilingue'));
    itemsList.add(EcoleItems(name: "Collège Harmony", cost: "35000/45000", pic: 'assets/photos/newest/5.jpg',
    nivEduc: 'Primaire/Collège', program: 'international/sciences appliquées', typeEts: 'École internationale'));
    itemsList.add(EcoleItems(name: "École Visionnaire", cost: "19000/35000", pic: 'assets/photos/newest/6.jpg',
    nivEduc: 'Maternelle/Primaire', program: 'linguistique/humaniste', typeEts: 'École privée'));
    itemsList.add(EcoleItems(name: "Académie Nova", cost: "20000/40000/65000", pic: 'assets/photos/newest/7.jpg',
    nivEduc: 'Maternelle/Primaire/Collège', program: 'développement personnel/technologique', typeEts: 'École religieuse'));
    itemsList.add(EcoleItems(name: "Collège Sagesse", cost: "32000/55000", pic: 'assets/photos/newest/8.jpg',
    nivEduc: 'Primaire/Collège', program: 'artistique/Sportif', typeEts: "École d'art"));
    itemsList.add(EcoleItems(name: "Lycée Renaissance", cost: "85000", pic: 'assets/photos/newest/9.jpg',
    nivEduc: 'Lycée', program: 'santé et médecine/sciences sociales', typeEts: "École d'enseignement spécialisé"));
    
    return itemsList;
  }
}



class EcoleShower extends StatelessWidget {
  const EcoleShower({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    List<Color>myColors = ColorsRepertory().colorApp0;
    List<EcoleItems> myEcole = EcoleItems.getNewestItems();
    return ListView.builder(
          itemCount: myEcole.length,
          itemBuilder: (context, index) {
          return 
          EcoleContainer(size: size, myModel: myEcole, myColors: myColors, index: index,);
        },
        );
  }
}
