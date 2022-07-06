import 'package:tafsirdictionary/providers/user.provider.dart';
import 'package:tafsirdictionary/screens/Welcome/welcome_screen.dart';
// import 'package:tafsirdictionary/screens/login/login_screen.dart';
import 'package:tafsirdictionary/widgets/app_version.dart';
// import '../../screens/Login1/login_screen.dart';
import 'drawer_app_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.835,
      height: height,
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const DrawerAppName(),
              Column(children: [
                TextButton(
                    child: const Text("Log Keluar"),
                    onPressed: () async {
                      await appUser.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()));
                    })
              ]),
              const AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}
