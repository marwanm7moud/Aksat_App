
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Omala {
   int id;
   String name;
   String asmelghaz;
   String wktel4ra;
   double s3r;
   double mkdm;
   double nsba;
   int addela4hr;
   double elmtbkeelmkdm;
   double agmalyelrb7;
   double agmalyels3r;
   double ydf3;

  Omala(
      {@required this.id,
      @required this.asmelghaz,
      @required this.wktel4ra,
      @required this.s3r,
      @required this.mkdm,
      @required this.nsba,
      @required this.addela4hr,
      @required this.elmtbkeelmkdm,
      @required this.agmalyelrb7,
      @required this.agmalyels3r,
      @required this.ydf3,
      @required this.name});
}

class MyProvider with ChangeNotifier {
  List OmalaNames = [];
  double agmaly = 0;
  double elrb7 = 0;
  int al3omala = 0;
  int id = 0;
  int m = 1;

  void Add(
      String name,
      String asmelghaz,
      String wktel4ra,
      double s3r,
      double mkdm,
      double nsba,
      int addela4hr,
      double elmtbkeelmkdm,
      double agmalyelrb7,
      double egmaleels3r,
      double ydf3) {
    OmalaNames.add(Omala(
      id: id,
      name: name,
      asmelghaz: asmelghaz,
      wktel4ra: wktel4ra,
      s3r: s3r,
      mkdm: mkdm,
      nsba: nsba,
      addela4hr: addela4hr,
      elmtbkeelmkdm: elmtbkeelmkdm,
      agmalyelrb7: agmalyelrb7,
      agmalyels3r: egmaleels3r,
      ydf3: ydf3,
    ));
    id++;
    al3omala++;
    notifyListeners();
  }

  void Update(
      int id,
      String name,
      String asmelghaz,
      String wktel4ra,
      double s3r,
      double mkdm,
      double nsba,
      int addela4hr,
      double elmtbkeelmkdm,
      double agmalyelrb7,
      double egmaleels3r,
      double ydf3) {
    var ame =  OmalaNames[OmalaNames.indexWhere((element) => element.id == id)] as Omala;
    ame.name = name;
    ame.asmelghaz = asmelghaz;
    ame.wktel4ra = wktel4ra;
    ame.s3r = s3r;
    ame.mkdm = mkdm;
    ame.nsba = nsba;
    ame.addela4hr = addela4hr;
    ame.elmtbkeelmkdm = elmtbkeelmkdm;
    ame.agmalyelrb7 = agmalyelrb7;
    ame.agmalyels3r = egmaleels3r;
    ame.ydf3 = ydf3;
    notifyListeners();
  }

  void refresh() {
    for(int i=0; i<=OmalaNames.length;i++){
      if(m<=OmalaNames.length){
        agmaly+=OmalaNames[i].s3r;
        elrb7+=OmalaNames[i].agmalyelrb7;
        m++;
      }else break;
    }
    notifyListeners();
  }

}
