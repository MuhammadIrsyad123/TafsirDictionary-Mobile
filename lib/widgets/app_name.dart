import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.12,
      left: MediaQuery.of(context).size.width * 0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("", style: Theme.of(context).textTheme.headline2),
          Text(
            "Tafsir\nDictionary",
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}
