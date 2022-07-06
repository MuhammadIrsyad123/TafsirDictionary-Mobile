import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafsirdictionary/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:tafsirdictionary/screens/landing-page.screen.dart';
import 'config/app_router.dart';
import 'config/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(480.0, 965.3333333333334),
      child: MultiProvider(
        providers: [ChangeNotifierProvider<AppUser>(create: (_) => AppUser())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tafsir Dictionary',
          theme: theme(),
          // home: LoginScreen(),
          // home: ProgramScreen(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: '/',
          routes: {
            '/': (context) => const LandingScreen(),
            // '/': (context) =>
            //     HomeScreen(maxSlide: MediaQuery.of(context).size.width * 0.835),
          },
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
