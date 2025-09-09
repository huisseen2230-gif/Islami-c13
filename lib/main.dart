import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/style/prefsHelper.dart';
import 'package:islami/ui/hadithDetails/screen/hadith_details_screen.dart';
import 'package:islami/ui/home/screen/home_Screen.dart';
import 'package:islami/ui/splash/screen/splash_screen.dart';
import 'package:islami/ui/sura_details/screen/suradetials_screen.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await PrefsHelper.init() ;
  runApp(const MyApp());
}
// hussein kassem
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
       SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadithDetailsScreen.routeName:(_)=>HadithDetailsScreen()

      },
      initialRoute:SplashScreen.routeName ,
    );
  }
}




