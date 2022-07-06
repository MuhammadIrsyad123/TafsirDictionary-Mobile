import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tafsirdictionary/screens/Welcome/welcome_screen.dart';
import 'package:tafsirdictionary/widgets/popup.dart';

// import '../screens/Login1/login_screen.dart';
// import '../Screens/Login/login_screen.dart';
// import '../screens/login/login_screen.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
    this.title,
    this.appBar,
  }) : super(key: key);
  final String? title;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFCE93D8),
      // leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     }),
      title: Center(child: Text('$title')),
      actions: [
        PopupMenuButton<MenuAction>(
          onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                }
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('Log Keluar'),
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar!.preferredSize.height);
}
