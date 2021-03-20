import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../Provider.dart';
import 'omala.dart';


class AddAmelScreen extends StatefulWidget {
  @override
  _AddAmelScreenState createState() => _AddAmelScreenState();
}

class _AddAmelScreenState extends State<AddAmelScreen> {
  TextStyle tTextStyle =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);


  var Nameamel = TextEditingController();
  var NameGhaz = TextEditingController();
  String datee = "";
  var s3relghaz = TextEditingController();
  var mkdm = TextEditingController();
  var nsba = TextEditingController();
  int month = 0;



  double get mtbkeb3delmkdm=>s3relghaz.text ==""||mkdm.text=="" ?0:double.parse(s3relghaz.text)-double.parse(mkdm.text);
  double get agmaleels3r =>mtbkeb3delmkdm == 0 || nsba.text==""?0:(mtbkeb3delmkdm*(double.parse(nsba.text)/100))+mtbkeb3delmkdm;
  double get agmaleelrb7 =>mtbkeb3delmkdm == 0 || nsba.text==""? 0:mtbkeb3delmkdm*(double.parse(nsba.text)/100);
  double get ydf3 =>agmaleelrb7==0?0:(agmaleels3r/month);

  bool s3r = false;
  bool mkdmm = false;
  bool nsbaa = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text("عــمــيــل جــديــد",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded), onPressed: (){
          Navigator.pop(context);
        }),
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
                if(s3relghaz.text.isNotEmpty &&mkdm.text.isNotEmpty &&nsba.text.isNotEmpty){
                  s3r = false;
                  mkdmm = false;
                  nsbaa = false;
                }else{
                  s3relghaz.text.isEmpty ? s3r = true : s3r = false;
                  mkdm.text.isEmpty ? mkdmm = true : mkdmm = false;
                  nsba.text.isEmpty ? nsbaa = true : nsbaa = false;
                }
                Provider.of<MyProvider>(context , listen: false).Add(Nameamel.text, NameGhaz.text, datee, double.parse(s3relghaz.text), double.parse(mkdm.text), double.parse(nsba.text), month, mtbkeb3delmkdm, agmaleelrb7 , agmaleels3r, ydf3);
                Navigator.pop(context);

              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                  focusNode: FocusNode(),
                  controller: Nameamel,
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
                  controller: NameGhaz,
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
                        controller: s3relghaz,
                        focusNode: FocusNode(),

                        enabled: true,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            labelText: "الــســعــر",
                          errorText: s3relghaz.text==null ? 'ادخل القيمة' : null,
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
                        controller: mkdm,
                        focusNode: FocusNode(),

                        enabled: true,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            errorText: mkdm.text==null ? 'ادخل القيمهة' : null,
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
                        controller: nsba,
                        focusNode: FocusNode(),
                        enabled: true,
                        maxLength: 3,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            errorText: nsba.text==null ? 'ادخل القيمهة' : null,
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
                            IconButton(iconSize: 15,icon: Icon(FontAwesomeIcons.minus), onPressed: (){
                              setState(() {
                                if(month>0)
                                  month--;
                                else
                                  null;
                              });
                            }),
                            Text("$month" , style: tTextStyle,),
                            IconButton(iconSize: 15,icon: Icon(FontAwesomeIcons.plus), onPressed: (){
                              setState(() {
                                month++;
                              });
                            }),
                          ],
                        )
                    ),

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
                        child: Text("${ydf3.isInfinite? agmaleels3r:ydf3.toStringAsFixed(2)}")),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
