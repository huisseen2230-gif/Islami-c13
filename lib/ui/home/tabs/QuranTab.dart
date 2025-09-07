import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';
import 'package:islami/style/constants.dart';
import 'package:islami/style/prefsHelper.dart';
import 'package:islami/style/stringsManager.dart';
import 'package:islami/ui/home/widgets/RecentlySuraWidget.dart';
import 'package:islami/ui/home/widgets/suraWidget.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filterList = [];
  String searchValue = "" ;
  List<SuraModel> mostRecentList = [] ;

  @override
  void initState() {

    super.initState();
    mostRecentList = PrefsHelper.getRecentList() ;

  }
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
            padding: EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Image.asset(AssetsManager.logo)),

                TextField(
                  onChanged: (value){
                   setState(() {
                     searchValue = value ;
                     searchSura(value);
                   });
                  },
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
                if(searchValue.isEmpty)
                  ...[
                    if(mostRecentList.isNotEmpty)
                   ...[ Text(StringsManager.mostRecently,style: TextStyle(
                      fontSize: 16,
                      fontFamily: "janna",
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.searchTextColor,
                    ),),
                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal ,
                          itemBuilder: (context,index)=>RecentlySuraWidget(
                            suraModel: mostRecentList[index],
                          ),
                          separatorBuilder: (context,index)=>SizedBox(width: 20,),
                          itemCount: mostRecentList.length
                      ),
                    ),],
                  ],
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
                      itemCount: searchValue.isNotEmpty
                          ?filterList.length
                          :suraList.length ,
                      itemBuilder: (context,index)=> SuraWidget(
                        addToRecent: (){
                         for(int i =0 ;i<mostRecentList.length ;i++){
                          if(mostRecentList[i]==(searchValue.isNotEmpty
                              ?filterList[index].suraNameEn
                              :suraList[index].suraNameEn)){
                            mostRecentList.removeAt(i);
                          }
                         }
                         mostRecentList.insert(0,searchValue.isNotEmpty
                             ?filterList[index]
                             :suraList[index]);
                          PrefsHelper.addRecentList(mostRecentList);
                          setState(() {

                          });
                        },
                        suraModel: searchValue.isNotEmpty
                            ?filterList[index]
                            :suraList[index],
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

  searchSura(String searchText){
    filterList = [] ;
  // for(int i = 0 ;i<suraList.length ; i++){
  //  if( suraList[i].suraNameEn.contains(searchText) ||
  //      suraList[i].suraNameAr.contains(searchText)||
  //      suraList[i].suraNumber.toString().contains(searchText)
  //  ){
  //   filterList.add(suraList[i]);
  //  }
  // }
    filterList = suraList.where((element)=>
        element.suraNameEn.toLowerCase().contains(searchText.toLowerCase()) ||
        element.suraNameAr.contains(searchText)||
        element.suraNumber.toString().contains(searchText)
    ).toList();
  }
}
