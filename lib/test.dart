// import 'package:elwatn/core/utils/app_colors.dart';
// import 'package:elwatn/core/utils/assets_manager.dart';
// import 'package:elwatn/features/profile/presentation/widgets/choose_language.dart';
// import 'package:elwatn/test_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_chips_input/flutter_chips_input.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Chips Input',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // brightness: Brightness.dark,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final _chipKey = GlobalKey<ChipsInputState>();
//   Color changeColor = AppColors.buttonBackground;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               ...List.generate(5, (index) => TextModel())
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class AppLanguage {
//   final String language;
//   final String image;
//
//   const AppLanguage({required this.language, required this.image});
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AppLanguage &&
//           runtimeType == other.runtimeType &&
//           language == other.language;
//
//   @override
//   int get hashCode => language.hashCode;
//
//   @override
//   String toString() {
//     return language;
//   }
// }
