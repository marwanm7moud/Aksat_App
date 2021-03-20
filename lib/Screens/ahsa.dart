import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider.dart';
class AhsaScreen extends StatefulWidget {
   @override
  _AhsaScreenState createState() => _AhsaScreenState();
}

class _AhsaScreenState extends State<AhsaScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("ألاجــمــالــى المـشــروع" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Text("${Provider.of<MyProvider>(context , listen: true).agmaly}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25 , color: Colors.green),),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("ألاجــمــالــى الربــــح" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Text("${Provider.of<MyProvider>(context , listen: true).elrb7}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25 , color: Colors.green),),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("ألاجــمــالــى الـــعـــمـــلاء" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Text("${Provider.of<MyProvider>(context , listen: true).al3omala}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25 , color: Colors.green),),
          ],
        ),
      ),
    );
  }
}
