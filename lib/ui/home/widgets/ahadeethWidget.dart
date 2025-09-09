import 'package:flutter/material.dart';
import 'package:islami/model/hadithModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';
import 'package:islami/ui/hadithDetails/screen/hadith_details_screen.dart';
import 'package:islami/ui/home/tabs/HadethTab.dart';

class AhadeethWidget extends StatelessWidget {
  HadithModel hadithModel ;
 AhadeethWidget({super.key , required this.hadithModel });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadithDetailsScreen.routeName,
            arguments:hadithModel );
      },
      child: Container(
        padding: EdgeInsets.only(top: 12),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                            AssetsManager.leftCorner,
                          color: ColorsManager.secondary,
                        ),
                        Expanded(
                          child: Text(hadithModel.title,
                            textAlign: TextAlign.center
                            ,style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: "janna",
                              color: ColorsManager.secondary,
                              fontSize: 20 ,
                            ),),
                        ),
                        Image.asset(
                            AssetsManager.rightCorner,
                          color: ColorsManager.secondary,
                        ),
                      ],
                    ),
                    SizedBox(height: 19,),
                    Expanded(
                      child:  Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(AssetsManager.hadithCardBack,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl ,
                            hadithModel.content,style: TextStyle(
                              color: ColorsManager.secondary ,
                              fontSize: 16 ,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(AssetsManager.suraTextBack,
              width: double.infinity,
              color: ColorsManager.secondary,

            ),
          ],
        ),
      ),
    );
  }
}
