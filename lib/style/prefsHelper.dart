import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
static late SharedPreferences prefs ;
static init()async{
 prefs = await SharedPreferences.getInstance() ;
}
static addRecentList(){

}
static getRecentList(){

}
}
class Person{
 static Person _instance = Person._init() ;
static Person getInstance()=>_instance ;
Person._init();
}