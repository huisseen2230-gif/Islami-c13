import 'package:islami/model/suraModel.dart';
import 'package:islami/style/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
static late SharedPreferences prefs ;
static init()async{
 prefs = await SharedPreferences.getInstance() ;
}
static addRecentList(List<SuraModel> mostRecentList ){
 List<String> mosRecentStringList = mostRecentList.map((sura)=> sura.suraNameEn).toList();
prefs.setStringList("mostRecently", mosRecentStringList);
}
static List<SuraModel> getRecentList(){
List<String> mostStringList = prefs.getStringList("mostRecently")??[];
List<SuraModel> mostRecent = [] ;
for(String suraName in mostStringList){
SuraModel suraFound =suraList.firstWhere((sura)=> sura.suraNameEn==suraName);
mostRecent.add(suraFound);
}
return mostRecent ;
}
}
class Person{
 static Person _instance = Person._init() ;
static Person getInstance()=>_instance ;
Person._init();
}