import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tafsirdictionary/screens/Welcome/welcome_screen.dart';
import 'package:tafsirdictionary/screens/screens.dart';
import 'package:tafsirdictionary/providers/user.provider.dart';
import 'package:provider/provider.dart';
// import 'Login1/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const String routeName = '/landing';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LandingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);

    if (appUser.user != null) {
      log('Logged in');
      return HomeScreen(maxSlide: MediaQuery.of(context).size.width * 0.835);
    } else {
      log('Not logged in');
      return const WelcomeScreen();
    }
  }
}
