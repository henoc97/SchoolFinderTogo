


import '../screens/forClients/homeScreen/component/for_ecole.dart';

class MoneySort{
  List <EcoleItems> ctgSort(String nivEduc){
    List<EcoleItems> myEcole = EcoleItems.getNewestItems();
    List <EcoleItems> moneySort = <EcoleItems>[];
    List <String> nivEducList = <String>[];
    List <String> elt = <String>[];

      for (var element in myEcole) {
        nivEducList = nivEduc.split(' / ');
        elt = element.nivEduc.split('/');
        for (var nivElt in nivEducList) {
          for (var e in elt) { 
            if(e==nivElt){
              moneySort.add(element);
            }
          }
        }
      }
    return moneySort;
  }
}