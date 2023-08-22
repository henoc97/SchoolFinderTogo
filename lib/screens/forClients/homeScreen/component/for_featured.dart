
import 'package:flutter/material.dart';

import '../../../../colors/colorsrepertory.dart';
import 'ecole_container.dart';


class FeaturedItems{
  FeaturedItems({required this.name, required this.cost, required this.pic });
  String name;
  int cost;
  String pic;

  static List<FeaturedItems> getNewestItems(){
    List<FeaturedItems> itemsList = <FeaturedItems>[];

    itemsList.add(FeaturedItems(name: "pijama", cost: 3500, pic: 'assets/photos/featured/baby2.jpeg'));
    itemsList.add(FeaturedItems(name: "casquette blanche", cost: 1500, pic: 'assets/photos/featured/casq1.jpeg'));
    itemsList.add(FeaturedItems(name: "chaussure J13", cost: 7500, pic: 'assets/photos/featured/chom1.jpeg'));
    itemsList.add(FeaturedItems(name: "cloth t4", cost: 3000, pic: 'assets/photos/featured/woman1.jpeg'));
    itemsList.add(FeaturedItems(name: "pull over", cost: 7000, pic: 'assets/photos/featured/pull.jpeg'));
    itemsList.add(FeaturedItems(name: "chemise blue", cost: 4000, pic: 'assets/photos/featured/man2.jpg'));
    itemsList.add(FeaturedItems(name: "chauss 78", cost: 10000, pic: 'assets/photos/featured/cfem1.jpeg'));
    itemsList.add(FeaturedItems(name: "robe Jaune ", cost: 1100, pic: 'assets/photos/featured/woman3.jpeg'));
    itemsList.add(FeaturedItems(name: "manche longue", cost: 9000, pic: 'assets/photos/featured/man1.jpg'));
    itemsList.add(FeaturedItems(name: "vet h54", cost: 2500, pic: 'assets/photos/featured/woman2.jpeg'));
    itemsList.add(FeaturedItems(name: "gucci", cost: 2000, pic: 'assets/photos/featured/casq2.jpeg'));
    itemsList.add(FeaturedItems(name: "kids", cost: 3000, pic: 'assets/photos/featured/kids.jpeg'));
    itemsList.add(FeaturedItems(name: "rangers", cost: 5500, pic: 'assets/photos/featured/chom3.jpeg'));
    itemsList.add(FeaturedItems(name: "chemise marron", cost: 5000, pic: 'assets/photos/featured/man3.jpeg'));
    itemsList.add(FeaturedItems(name: "la rose N", cost: 7000, pic: 'assets/photos/featured/cfem2.jpeg'));
    return itemsList;
  }
}



class FeaturedShower extends StatelessWidget {
  const FeaturedShower({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    List<Color>myColors = ColorsRepertory().colorApp0;
    List<FeaturedItems> myFeatured = FeaturedItems.getNewestItems();
    return SizedBox(height: size.height*.32,
    child: ListView.builder(
          itemCount: myFeatured.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          return 
          EcoleContainer(size: size, myModel: myFeatured, myColors: myColors, index: index,);
        },
        ),
    );
  }
}
