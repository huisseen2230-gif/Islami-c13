import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';
import 'package:islami/ui/sura_details/screen/suradetials_screen.dart';

class SuraWidget extends StatelessWidget {
  final SuraModel suraModel ;
  final void Function() addToRecent ;
   SuraWidget({super.key,required this.suraModel,required this.addToRecent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        addToRecent() ;
       Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
           arguments: suraModel
       );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AssetsManager.suraNumber,
                height: 52,
                width: 52,
              ),
              Text(
                  suraModel.suraNumber.toString(),style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                fontFamily: "janna",
                color: Colors.white,

              ),

              ),
            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 suraModel.suraNameEn,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: "janna",
                    color: Colors.white
                ),
                ),
                Text(
                  "${suraModel.suraVersesNumber} Verses",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    fontFamily: "janna",
                    color: Colors.white
                ),
                ),
              ],
            ),
          ),
          Text(suraModel.suraNameAr,style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              fontFamily: "janna",
              color: Colors.white
          ),),
        ],
      ),
    );
  }
}
