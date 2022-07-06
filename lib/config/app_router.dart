import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tafsirdictionary/screens/landing-page.screen.dart';
import 'package:tafsirdictionary/screens/modul/forum/forum_pertanyaan.dart';
import 'package:tafsirdictionary/screens/modul/tafsir/ilmu_tafsiran.dart';
import 'package:tafsirdictionary/screens/screens.dart';
import '../screens/modul/contoh/contoh_tafsiran.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('This is route: ${settings.name}');

    switch (settings.name) {
      case LandingScreen.routeName:
        return LandingScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case ForumPertanyaan.routeName:
        return ForumPertanyaan.route();
      case ContohTafsiran.routeName:
        return ContohTafsiran.route();
      case IlmuTafsiran.routeName:
        return IlmuTafsiran.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
