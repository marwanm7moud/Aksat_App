import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider.dart';
class Amel extends StatelessWidget {
  final int id;
 final String name;
  final String asmelghaz;
  final String wktel4ra;
  final double s3r;
  final double mkdm;
  final double nsba;
  final int addela4hr;
  final double elmtbkeelmkdm;
  final double agmalyelrb7;
  final double agmalyels3r;
  final double ydf3;
  Amel( this.id,this.name, this.asmelghaz, this.wktel4ra, this.s3r, this.mkdm, this.nsba, this.addela4hr, this.elmtbkeelmkdm, this.agmalyelrb7, this.agmalyels3r, this.ydf3);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Colors.green.withOpacity(0.6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)),
      elevation: 10,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed("amel", arguments: [
            {
              "id":this.id,
              "name": this.name,
              "aasmelghaz": this.asmelghaz,
              "wktel4ra":  this.wktel4ra,
              "s3r":   this.s3r,
              "mkdm":   this.mkdm,
              "nsba":  this.nsba,
              "addela4hr":  this.addela4hr,
              "elmtbkeelmkdm":   this.elmtbkeelmkdm,
              "agmalyelrb7":   this.agmalyelrb7,
              "agmalyels3r":   this.agmalyels3r,
              "ydf3":   this.ydf3
            }
          ]);
        },
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15 , top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${name}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15 , top: 15),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "الـمـبـلـغ الـمـتـبـقـى : ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.105,),
                    Text(
                      "$agmalyels3r",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      textDirection: TextDirection.rtl,
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "الاشـهـر الـمـتـبـقـيـة :",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.1,),

                    Text(
                      "$addela4hr",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      textDirection: TextDirection.rtl,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
