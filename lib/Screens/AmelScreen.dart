import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../Provider.dart';
import 'omala.dart';

class AmelScreen extends StatefulWidget {
  @override
  _AmelScreenState createState() => _AmelScreenState();
}

class _AmelScreenState extends State<AmelScreen> {
  TextStyle tTextStyle =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

  bool s3r = false;
  bool mkdmm = false;
  bool nsbaa = false;
  int screen = 0;
  var modle;

  var id;

  List names;

  var m;

  var Nameamel;

  var NameGhaz;

  String datee;

  var s3relghaz;
  var mkdm;

  var nsba;

  int month;

  var Nameamelcon;

  var NameGhazcon;

  var s3relghazcon;

  var mkdmcon;

  var nsbacon;
  var monthcon;

  var mtbkeb3delmkdmcon;
  var agmaleels3rcon;

  var agmaleelrb7con;

  var ydf3con;

  double mtbkeb3delmkdm = 0;

  double get agmaleels3r => mtbkeb3delmkdm == 0 || nsba == 0
      ? 0
      : (mtbkeb3delmkdm * (double.parse(nsba) / 100)) + mtbkeb3delmkdm;

  double get agmaleelrb7 => mtbkeb3delmkdm == 0 || nsba == 0
      ? 0
      : mtbkeb3delmkdm * (double.parse(nsba) / 100);

  double get ydf3 => agmaleelrb7 == 0 ? 0 : (agmaleels3r / month);

  @override
  Widget build(BuildContext context) {
    modle = ModalRoute.of(context).settings.arguments as List<Map>;
    id = modle[0]["id"];
    names = Provider.of<MyProvider>(context, listen: true).OmalaNames;
    m = names[names.indexWhere((element) => element.id == id)] as Omala;
    Nameamel = m.name;
    NameGhaz = m.asmelghaz;
    datee = m.wktel4ra;
    s3relghaz = m.s3r;
    mkdm = m.mkdm;
    nsba = m.nsba;
    month = m.addela4hr;
    Nameamelcon = TextEditingController(text: Nameamel);
    NameGhazcon = TextEditingController(text: NameGhaz);
    s3relghazcon = TextEditingController(text: "${s3relghaz}");
    mkdmcon = TextEditingController(text: "${mkdm}");
    nsbacon = TextEditingController(text: "${nsba}");
    monthcon = TextEditingController(text: "${month}");
    mtbkeb3delmkdmcon = TextEditingController(text: "${mtbkeb3delmkdm}");
    agmaleels3rcon = TextEditingController(text: "${agmaleels3r}");
    agmaleelrb7con = TextEditingController(text: "${agmaleelrb7}");
    ydf3con = TextEditingController(text: "${ydf3}");
    List Screen = [
      {
        "appbar": AppBar(
          elevation: 20,
          title:
              Text("$Nameamel", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.green,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                icon: Icon(LineIcons.pen),
                onPressed: () {
                  setState(() {
                    screen++;
                  });
                })
          ],
        ),
        "body": SingleChildScrollView(
          child: Container(
            color: Colors.green.withOpacity(0.3),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  ///
                  ///
                  ///
                  /// asm elamel
                  ///
                  ///
                  ///
                  ///
                  Text(
                    "اسـم الـعــمــيـــل : ",
                    style: tTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    focusNode: FocusNode(),
                    initialValue: Nameamel,
                    enabled: false,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),

                  ///
                  ///
                  ///
                  ///asm elghaz
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "اســـم الــجــهــاز : ",
                    style: tTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: NameGhaz,
                    focusNode: FocusNode(),
                    enabled: false,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///w2t 4ra elghaz
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "وقــت شــراء الــجــهــاز : ",
                    style: tTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1)),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: datee == ""
                                  ? Text("الـــتـــاريـــخ")
                                  : Text(datee))),
                    ],
                  ),

                  ///
                  ///
                  ///
                  /// s3r elghaz
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ســعــر الـجــهــاز : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: "$s3relghaz",
                          focusNode: FocusNode(),
                          enabled: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              errorText: s3r ? 'ادخل القيمهة' : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///
                  /// almkdm
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "مــقــدم الـجــهــاز : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: "$mkdm",
                          focusNode: FocusNode(),
                          enabled: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              errorText: mkdmm ? 'ادخل القيمهة' : null,
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  /// alnsba
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "نــســبــة الــربــح : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: "$nsba",
                          focusNode: FocusNode(),
                          enabled: false,
                          maxLength: 3,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              errorText: nsbaa ? 'ادخل القيمهة' : null,
                              counterText: "",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///
                  ///
                  /// al a4hr
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "عــــدد الاشــهــر : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  iconSize: 15,
                                  icon: Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      if (month > 0)
                                        month--;
                                      else
                                        null;
                                    });
                                  }),
                              Text(
                                "$month",
                                style: tTextStyle,
                              ),
                              IconButton(
                                  iconSize: 15,
                                  icon: Icon(FontAwesomeIcons.plus),
                                  onPressed: () {
                                    setState(() {
                                      month++;
                                    });
                                  }),
                            ],
                          )),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///almtbke b3d el mkdm
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المـتـبـقـى بـعـد الـمـقدم : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1)),
                          child: Text("$mtbkeb3delmkdm")),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///al agmaly b3d elrb7
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اجـمـالـى الـسـعـر بـعـد الـربـح : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1)),
                          child: Text("$agmaleels3r")),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///agmaly elrb7
                  ///
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اجـمـالـى الـربـح : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1)),
                          child: Text("$agmaleelrb7")),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///kol 4hr
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "يــدفــع كــل شــهــر : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1)),
                          child: Text(
                              "${ydf3.isInfinite ? agmaleels3r : ydf3.toStringAsFixed(2)}")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      },
      {
        "appbar": AppBar(
          elevation: 20,
          title:
              Text("$Nameamel", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.green,
          leading: TextButton(
            child: Text(
              "الـغـاء",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            onPressed: () {
              setState(() {
                screen--;
              });
            },
          ),
          actions: [
            TextButton(
              child: Text(
                "حـفـظ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onPressed: () {
                setState(() {
                  if (s3relghazcon.text.isNotEmpty &&
                      mkdmcon.text.isNotEmpty &&
                      nsbacon.text.isNotEmpty) {
                    s3r = false;
                    mkdmm = false;
                    nsbaa = false;
                  } else {
                    s3relghazcon.text.isEmpty ? s3r = true : s3r = false;
                    mkdmcon.text.isEmpty ? mkdmm = true : mkdmm = false;
                    nsbacon.text.isEmpty ? nsbaa = true : nsbaa = false;
                  }
                  Provider.of<MyProvider>(context, listen: false).Update(
                      id,
                      Nameamelcon.text,
                      NameGhazcon.text,
                      datee,
                      double.parse(s3relghazcon.text),
                      double.parse(mkdmcon.text),
                      double.parse(nsbacon.text),
                      int.parse(monthcon.text),
                      double.parse(mtbkeb3delmkdmcon.text),
                      double.parse(agmaleelrb7con.text),
                      double.parse(agmaleels3rcon.text),
                      double.parse(ydf3con.text));
                  screen--;
                });
              },
            ),
          ],
        ),
        "body": SingleChildScrollView(
          child: Container(
            color: Colors.green.withOpacity(0.3),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  ///
                  ///
                  ///
                  /// asm elamel
                  ///
                  ///
                  ///
                  ///
                  Text(
                    "اسـم الـعــمــيـــل : ",
                    style: tTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    onSubmitted:(value){
                      setState(() {
                        Nameamel = value;
                      });
                    } ,
                    focusNode: FocusNode(),
                    controller: Nameamelcon,
                    enabled: true,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        labelText: "اكــتــب الاســم",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),

                  ///
                  ///
                  ///
                  ///asm elghaz
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "اســـم الــجــهــاز : ",
                    style: tTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  TextField(
                    controller: NameGhazcon,
                    focusNode: FocusNode(),
                    enabled: true,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        labelText: "اكــتــب اســم الــجــهــاز",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///w2t 4ra elghaz
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "وقــت شــراء الــجــهــاز : ",
                    style: tTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 1)),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: datee == ""
                                  ? Text("الـــتـــاريـــخ")
                                  : Text(datee))),
                      IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2010, 1, 1),
                                maxTime: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day), onChanged: (date) {
                              setState(() {
                                String convertedDateTime =
                                    "${date.year.toString()}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')} ";

                                datee = convertedDateTime;
                              });
                            }, onConfirm: (date) {
                              setState(() {
                                String convertedDateTime =
                                    "${date.year.toString()}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
                                datee = convertedDateTime;
                              });
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.ar);
                          });
                        },
                      ),
                    ],
                  ),

                  ///
                  ///
                  ///
                  /// s3r elghaz
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ســعــر الـجــهــاز : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: s3relghazcon,
                          focusNode: FocusNode(),
                          enabled: true,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              labelText: "الــســعــر",
                              errorText: s3r ? 'ادخل القيمهة' : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///
                  /// almkdm
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "مــقــدم الـجــهــاز : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: mkdmcon,
                          focusNode: FocusNode(),
                          enabled: true,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              errorText: mkdmm ? 'ادخل القيمهة' : null,
                              labelText: "الــمــقــدم",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  /// alnsba
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "نــســبــة الــربــح : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: nsbacon,
                          focusNode: FocusNode(),
                          enabled: true,
                          maxLength: 3,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              errorText: nsbaa ? 'ادخل القيمهة' : null,
                              counterText: "",
                              labelText: "%",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///
                  ///
                  /// al a4hr
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "عــــدد الاشــهــر : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  iconSize: 15,
                                  icon: Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      if (month > 0)
                                        month--;
                                      else
                                        null;
                                    });
                                  }),
                              Text(
                                "$month",
                                style: tTextStyle,
                              ),
                              IconButton(
                                  iconSize: 15,
                                  icon: Icon(FontAwesomeIcons.plus),
                                  onPressed: () {
                                    setState(() {
                                      month++;
                                    });
                                  }),
                            ],
                          )),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///almtbke b3d el mkdm
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المـتـبـقـى بـعـد الـمـقدم : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 1)),
                          child: Text("$mtbkeb3delmkdm")),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///al agmaly b3d elrb7
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اجـمـالـى الـسـعـر بـعـد الـربـح : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 1)),
                          child: Text("$agmaleels3r")),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///agmaly elrb7
                  ///
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اجـمـالـى الـربـح : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 1)),
                          child: Text("$agmaleelrb7")),
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///kol 4hr
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "يــدفــع كــل شــهــر : ",
                        style: tTextStyle,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.08,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 1)),
                          child: Text(
                              "${ydf3.isInfinite ? agmaleels3r : ydf3.toStringAsFixed(2)}")),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(width: 2, color: Colors.green)),
                        onPressed: () {
                          setState(() {
                            if (s3relghazcon.text.isNotEmpty &&
                                mkdmcon.text.isNotEmpty &&
                                nsbacon.text.isNotEmpty) {
                              s3r = false;
                              mkdmm = false;
                              nsbaa = false;
                            } else {
                              s3relghazcon.text.isEmpty
                                  ? s3r = true
                                  : s3r = false;
                              mkdmcon.text.isEmpty
                                  ? mkdmm = true
                                  : mkdmm = false;
                              nsbacon.text.isEmpty
                                  ? nsbaa = true
                                  : nsbaa = false;
                            }
                          });
                        },
                        child: Text(
                          "احسب",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      }
    ];

    return Scaffold(
      appBar: Screen[screen]["appbar"],
      body: Screen[screen]["body"],
    );
  }
}
