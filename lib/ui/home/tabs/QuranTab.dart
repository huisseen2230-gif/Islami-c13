import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';
import 'package:islami/style/constants.dart';
import 'package:islami/style/stringsManager.dart';
import 'package:islami/ui/home/widgets/RecentlySuraWidget.dart';
import 'package:islami/ui/home/widgets/suraWidget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.quranBack),
            fit: BoxFit.fitWidth
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Image.asset(AssetsManager.logo)),

                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "janna" ,
                    color: ColorsManager.searchTextColor,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(

                    isCollapsed: true,
                    fillColor: ColorsManager.secondary.withOpacity(0.7),
                    filled: true,
                    hintText: "Enter sura name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "janna" ,
                      color: ColorsManager.searchTextColor,
                    ) ,
                    prefixIconConstraints: BoxConstraints(
                      maxHeight:54,
                      maxWidth: 54,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(14),
                      child: SvgPicture.asset(
                          AssetsManager.quran,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorsManager.primary
                      )
                    ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: ColorsManager.primary
                      )
                  ),
                  ) ,
                ),
                SizedBox(height: 20,),
                Text(StringsManager.mostRecently,style: TextStyle(
                  fontSize: 16,
                  fontFamily: "janna",
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.searchTextColor,
                ),),
               Expanded(
                 child: ListView.separated(
                   scrollDirection: Axis.horizontal ,
                     itemBuilder: (context,index)=>RecentlySuraWidget(),
                     separatorBuilder: (context,index)=>SizedBox(width: 20,),
                     itemCount: 10),
               ),
                Text(StringsManager.surasList,style: TextStyle(
                  fontSize: 16,
                  fontFamily: "janna",
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.searchTextColor,
                ),),
                SizedBox(height: 10,),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemCount: suraList.length,
                      itemBuilder: (context,index)=> SuraWidget(
                        suraModel: suraList[index],
                      ),
                    separatorBuilder: (context,index)=>Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 44
                      ),
                      child: Divider(
                        height: 20,
                      ),
                    ) ,
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
