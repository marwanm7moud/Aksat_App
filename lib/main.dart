import 'package:aksat/Provider.dart';
import 'package:aksat/Screens/AmelScreen.dart';
import 'package:aksat/Screens/MainScreen.dart';
import 'package:aksat/Screens/addAmelScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ChangeNotifierProvider<MyProvider>(
        create: (_)=>MyProvider(),
        child: MyApp(),

      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "a7sa":(context)=>MainScreen(0),
        "omala":(context)=>MainScreen(1),
        "notifi":(context)=>MainScreen(2),
        "add":(context)=> new AddAmelScreen(),
        "amel":(context)=> new AmelScreen(),

      },
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(0);
  }
}
