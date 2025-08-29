import 'package:flutter/material.dart';
import 'package:islami/style/assetsManager.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

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
    );
  }
}
