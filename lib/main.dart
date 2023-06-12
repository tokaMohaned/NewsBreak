import 'package:flutter/material.dart';
import 'package:newsapi/screens/layout_home.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName:(context)=>HomeScreen(),

      },
      // theme: MyThemeData.lightTheme,
      // darkTheme:MyThemeData.darkTheme ,
      //themeMode: ,
      debugShowCheckedModeBanner: false,

    );
  }
}


