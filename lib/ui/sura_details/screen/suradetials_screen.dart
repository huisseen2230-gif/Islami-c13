import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura details" ;

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraText = "" ;
 late SuraModel suraModel ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel ;
   if(suraText.isEmpty){
     loadFile(suraModel.suraNumber.toString());
   }
    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsManager.primary
        ) ,
        backgroundColor: Colors.transparent,
        title: Text(
          suraModel.suraNameEn,
          style: TextStyle(
            fontFamily: "janna",
            color: ColorsManager.primary ,
            fontWeight: FontWeight.w700 ,
            fontSize: 24 ,
          ),
        ) ,
      ),
      body: Column(
        children: [
         Expanded(
           child: Padding(
             padding:  EdgeInsets.symmetric(horizontal: 18),
             child: Column(
               children: [
                 Row(
                   children: [
                     Image.asset(
                         AssetsManager.leftCorner),
                     Expanded(
                       child: Text(suraModel.suraNameAr,
                         textAlign: TextAlign.center
                         ,style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: "janna",
                           color: ColorsManager.primary,
                           fontSize: 24 ,
                         ),),
                     ),
                     Image.asset(
                         AssetsManager.rightCorner),
                   ],
                 ),
                 SizedBox(height: 19,),
                 Expanded(
                   child: suraText.isEmpty? Center(
                     child: CircularProgressIndicator(
                         color: ColorsManager.primary,
                         ),)
                   : SingleChildScrollView(
    child: Text(
    textAlign: TextAlign.center,
    textDirection: TextDirection.rtl ,
    suraText,style: TextStyle(
    color: ColorsManager.primary ,
    fontSize: 24 ,
    fontWeight: FontWeight.w700
    ),),
    ),
                 ),
               ],
             ),
           ),
         ),
          Image.asset(AssetsManager.suraTextBack,
            width: double.infinity,

          ),
        ],
      ),
    );
  }

  loadFile(String suraNumber)async{
   suraText = await rootBundle.loadString("assets/files/Suras/$suraNumber.txt");
   List<String> lines = suraText.split("\n");
   String temp = "" ;

   for(int i = 0 ; i<lines.length ; i++){
    temp+= lines[i].trim();
    temp+= "(${i+1})" ;
   }
   suraText = temp ;
    setState(() {

    });
  }
}
