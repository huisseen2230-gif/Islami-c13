import 'package:flutter/material.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';

class RecentlySuraWidget extends StatelessWidget {
  final SuraModel suraModel ;
  RecentlySuraWidget({super.key,required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.primary
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraModel.suraNameEn,style: TextStyle(
                  fontFamily: "janna",
                  color: ColorsManager.secondary,
                  fontSize:24 ,
                  fontWeight:FontWeight.w700 ,
                ),),
                Text(suraModel.suraNameAr,style: TextStyle(
                  fontFamily: "janna",
                  color: ColorsManager.secondary,
                  fontSize:24 ,
                  fontWeight:FontWeight.w700 ,
                ),),
                Text("${suraModel.suraVersesNumber} verses",style: TextStyle(
                  fontFamily: "janna",
                  color: ColorsManager.secondary,
                  fontSize:14 ,
                  fontWeight:FontWeight.w700 ,
                ),),

              ],
            ),
          ),
          Image.asset(AssetsManager.quranCard)
        ],
      ),
    );
  }
}
