import 'package:aksat/Provider.dart';
import 'package:aksat/Widget/Amelwid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

class OmalaScreen extends StatefulWidget {
  @override
  _OmalaScreenState createState() => _OmalaScreenState();
}

class _OmalaScreenState extends State<OmalaScreen> {
  @override
  Widget build(BuildContext context) {
    List names = Provider.of<MyProvider>(context).OmalaNames;
    return names.isEmpty
        ? Container(
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "لا يوجد اي عميل حتي الان",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.add,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("add");
                          },
                        )))
              ],
            ),
          )
        : Container(
            child: Stack(
              children: [
                GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio:2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing:10 ,
                  maxCrossAxisExtent: 500,

                ),
                  children: [
                    ...names.map((e) =>
                        Amel(e.id , e.name , e.asmelghaz,e.wktel4ra , e.s3r ,e.mkdm , e.nsba , e.addela4hr , e.elmtbkeelmkdm , e.agmalyelrb7 , e.agmalyels3r , e.ydf3)

                    ).toList()
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () {
                        Navigator.of(context).pushNamed("add");
                      },
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
