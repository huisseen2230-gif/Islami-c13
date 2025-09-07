import 'package:flutter/material.dart';
import 'package:islami/style/assetsManager.dart';

class SebhaWidget extends StatefulWidget {
  SebhaWidget({super.key});

  @override
  State<SebhaWidget> createState() => _SebhaWidgetState();
}

class _SebhaWidgetState extends State<SebhaWidget>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  int phraseIndex = 0;
  double rotation = 0;

  List<String> phrases = [
    "الله أكبر",
    "الحمد لله",
    "لا إله إلا الله",
    "سبحان الله",
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          rotation += 15; // كل ضغطة تلف 15 درجة
          counter++;

          if (counter > 30) {
            counter = 1; // يبدأ من 1 مش 0
            phraseIndex = (phraseIndex + 1) % phrases.length;
          }
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.sebhaBack),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  AssetsManager.logo,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    fontFamily: "janna",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: rotation * 3.14 / 180, // تحويل لدرجات
                      child: Image.asset(
                        AssetsManager.sebhaCard,
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      child: Column(
                        children: [
                          Text(
                            phrases[phraseIndex],
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              fontFamily: "janna",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$counter",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              fontFamily: "janna",
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
