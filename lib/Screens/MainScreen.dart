import 'package:aksat/Provider.dart';
import 'package:aksat/Screens/ahsa.dart';
import 'package:aksat/Screens/noti.dart';
import 'package:aksat/Screens/omala.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  int i;
  MainScreen(this.i);
  @override
  _MainScreenState createState() => _MainScreenState(i);
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex ;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  _MainScreenState(this._selectedIndex);
    @override
  Widget build(BuildContext context) {
     List<Map<String , Object>> _widgetOptions = [
      {"wid":AhsaScreen()
      ,"appbar":AppBar(
        elevation: 20,
        title: Text("احـــصــاء", style: TextStyle(fontWeight: FontWeight.bold )),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: (){
            Provider.of<MyProvider>(context , listen: false).refresh();
          })
        ],
        backgroundColor: Colors.green,
      ),
      },
      {"wid":OmalaScreen(),
        "appbar":AppBar(
        elevation: 20,
        title: Text("عــــمـــلاء", style: TextStyle(fontWeight: FontWeight.bold )),
        centerTitle: true,
        leading: Container(),
        backgroundColor: Colors.green,
      ),},
      {
        "wid":NotifiScreen(),
        "appbar":AppBar(
        elevation: 20,
        title: Text("اشــعــارات", style: TextStyle(fontWeight: FontWeight.bold )),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      }
    ];


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _widgetOptions[_selectedIndex]["appbar"],
      body: _widgetOptions[_selectedIndex]["wid"],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.green, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300],
                hoverColor: Colors.green,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                duration: Duration(milliseconds: 100),
                tabBackgroundColor: Colors.green.shade200,
                tabs: [
                  GButton(
                    icon: Icons.bar_chart_outlined,
                    text: 'الاحصائيات',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'العملاء',
                  ),
                  GButton(
                    icon: Icons.notifications_active_outlined,
                    text: 'اشعارات',
                  ),


                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
