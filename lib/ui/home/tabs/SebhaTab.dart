import 'package:flutter/material.dart';
import 'package:islami/style/assetsManager.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsManager.sebhaBack),
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }
}
