import 'package:contect_diary_1/Moduls/Screens/Add_Contect_Screen/Views/add_contect_screen.dart';
import 'package:contect_diary_1/Moduls/Screens/Splash_Screen/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Moduls/Screens/Add_Contect_Screen/Providers/contect_provider.dart';
import 'Moduls/Screens/Contect_Detail/Views/contect_datail.dart';
import 'Moduls/Screens/Home_Screen/Views/home_screen.dart';
import 'Utils/Themes/app_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<ContectProvider>(
        create: (ctx) => ContectProvider(),
      ),
    ],
    builder: (ctx, _) => MaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const Splash_Screen(),
        'home': (ctx) => const HomeScreen(),
        'add_contect': (ctx) => const add_conect_screen(),
        'contect_detail': (ctx) => const ContectDetailScreen(),
      },
    ),
  ));
}
