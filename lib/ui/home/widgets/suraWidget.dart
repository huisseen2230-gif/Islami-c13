import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';

class SuraWidget extends StatelessWidget {
  SuraModel suraModel ;
   SuraWidget({super.key,required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              color: Colors.white
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
    );
  }
}
