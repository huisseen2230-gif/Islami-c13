import 'package:flutter/material.dart';
import 'package:islami/style/assetsManager.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsManager.radioBack),
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }
}
