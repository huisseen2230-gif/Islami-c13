import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadithModel.dart';
import 'package:islami/style/assetsManager.dart';
import 'package:islami/style/colorsManager.dart';
import 'package:islami/ui/hadithDetails/screen/hadith_details_screen.dart';
import 'package:islami/ui/home/widgets/ahadeethWidget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  PageController controller = PageController(viewportFraction: 0.8);

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFiles() ;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsManager.ahadeethBack),
            fit: BoxFit.fitWidth
        ),
      ),
      child: Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(AssetsManager.logo)),
          SizedBox(height:  55) ,
          Expanded(
            child: ahadith.isEmpty
                ?Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primary,
              ),
            )
                :PageView.builder(
              controller: controller,
                itemCount: ahadith.length,
                itemBuilder: (context, index) => AhadeethWidget(hadithModel: ahadith[index],),

            ),
          )
        ],
      ),
    );
  }

  List<HadithModel> ahadith = [] ;

  Future<void> loadFiles() async {
    for (int i = 1; i <= 50; i++) {
      String path = "assets/files/Hadeeth/h$i.txt";
      String text = await rootBundle.loadString(path);
      List<String> lines = text.trim().split("\n");
      String title = lines[0];
      String content = lines.sublist(1).join("\n");

      ahadith.add(HadithModel(title: title, content: content));
    }

    setState(() {}); // علشان تعيد بناء الواجهة بعد تحميل البيانات
  }
}
