// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran_app/core/Widget/Containerwidget.dart';
// import 'package:quran_app/core/Widget/backgimageApp.dart';
// import 'package:quran_app/core/appthem/appthem.dart';
// import 'package:quran_app/feature/viewmodel/setting_provider.dart';
//
// class Sebha extends StatefulWidget {
//   const Sebha({super.key});
//
//   @override
//   State<Sebha> createState() => _SebhaState();
// }
//
// class _SebhaState extends State<Sebha> {
//   int count = 0;
//   int index = 0;
//   double turn = 0;
//
//   List<String> azkar = [
//     'سبحان الله',
//     'الحمد لله',
//     "لا إله إلا الله",
//     "الله أكبر",
//     ' لا حول ولا قوة إلا بالله ',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height * 0.06;
//     TextTheme textTheme = Theme.of(context).textTheme;
//     setting_provider settingprovider = Provider.of<setting_provider>(context);
//     return Backgimageapp(
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: 10),
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Image(
//                       image: AssetImage(
//                         settingprovider.isdark
//                             ? 'assets/images/head_sebha_dark.png'
//                             : 'assets/images/head_sebha_logo.png',
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.09,
//                     ),
//                     child: AnimatedRotation(
//                       turns: turn,
//                       duration: const Duration(milliseconds: 500),
//                       child: Image(
//                         image: AssetImage(
//                           settingprovider.isdark
//                               ? 'assets/images/body_sebha_dark.png'
//                               : 'assets/images/body_sebha_logo.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Column(
//                 children: [
//                   Text('عدد التسبيحات', style: textTheme.titleMedium),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll(
//                         settingprovider.isdark
//                             ? AppThem.gold
//                             : AppThem.primarylight,
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       count.toString(),
//                       style: textTheme.titleSmall?.copyWith(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Containerwidget(
//                     child: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           count++;
//                           turn += 0.0333;
//                           if (count == 34) {
//                             count = 0;
//                             index++;
//                           }
//                           if (index == azkar.length) {
//                             index = 0;
//                           }
//                         });
//                       },
//                       icon: Text(
//                         azkar[index],
//                         style: textTheme.titleSmall?.copyWith(fontSize: 25),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }