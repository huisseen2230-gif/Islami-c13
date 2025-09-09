import 'package:flutter/material.dart';
import 'package:islami/model/hadithModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = "hadith details screen";

  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
    ModalRoute.of(context)!.settings.arguments as HadithModel;

    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsManager.primary),
        backgroundColor: Colors.transparent,
        title: Text(
          hadithModel.title,
          style: TextStyle(
            fontFamily: "janna",
            color: ColorsManager.primary,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          // المحتوى Scrollable
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 60),
              child: Column(
                children: [
                  Text(
                    hadithModel.content,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: ColorsManager.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    AssetsManager.suraTextBack,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),

          // الكورنر الشمال
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(AssetsManager.leftCorner),
          ),

          // الكورنر اليمين
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(AssetsManager.rightCorner),
          ),
        ],
      ),
    );
  }
}
