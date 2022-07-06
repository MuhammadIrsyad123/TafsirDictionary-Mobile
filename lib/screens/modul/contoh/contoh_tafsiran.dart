import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/popup.dart';
import '../../Login1/login_screen.dart';
// import '../../login/login_screen.dart';
import 'kandungan_tafsiran.dart';

class ContohTafsiran extends StatefulWidget {
  static const String routeName = '/contoh_tafsir';

  const ContohTafsiran({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ContohTafsiran(),
    );
  }

  @override
  State<ContohTafsiran> createState() => _ContohTafsiranState();
}

class _ContohTafsiranState extends State<ContohTafsiran> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Map<String, dynamic>> services = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: const Color(0xFFCE93D8),
        // leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     }),
        title: const Center(child: Text('Contoh Tafsiran')),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(services: services),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          ),
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
                            builder: (context) => const LoginScreen()));
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
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          //List View
          Expanded(
            child: loading
                ? const SizedBox(
                    width: double.infinity,
                    child: Center(child: CircularProgressIndicator()))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: services.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => KandunganContoh(
                                        data: services[index],
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 70,
                          decoration: const BoxDecoration(
                              color: Color(0xFFEDE7F6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // SizedBox(
                              //   width: 30.w,
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      services[index]["nama_surah"],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RaleWay',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
          ),
        ],
      ),
    );
  }

  Future getData() async {
    await FirebaseFirestore.instance
        .collection("contoh_tafsir")
        .get()
        .then((value) {
      for (var element in value.docs) {
        Map<String, dynamic> data = element.data();
        data.addAll({'id': element.id});
        services.add(data);
      }
      if (mounted) {
        loading = false;
        setState(() {});
      }
    });
  }
}

class MySearchDelegate extends SearchDelegate {
  List services;
  MySearchDelegate({
    required this.services,
  });

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Cari Metode";
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null); //close search bar
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) {
    List data = [];

    for (int i = 0; i < services.length; i++) {
      if ((services[i]["nama_surah"] as String).toLowerCase() ==
          query.toLowerCase()) {
        data.add(services[i]);
      }
    }

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => KandunganContoh(
                          data: data[index],
                        )));
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 70,
            decoration: const BoxDecoration(
                color: Color(0xFFEDE7F6),
                borderRadius: BorderRadius.all(Radius.circular(7))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   width: 30.w,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      child: Text(
                        data[index]["nama_surah"],
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RaleWay',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List data = [];

    for (int i = 0; i < services.length; i++) {
      if ((services[i]["nama_surah"] as String)
          .toLowerCase()
          .contains(query.toLowerCase())) {
        data.add(services[i]);
      }
    }

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => KandunganContoh(
                          data: data[index],
                        )));
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 70,
            decoration: const BoxDecoration(
                color: Color(0xFFEDE7F6),
                borderRadius: BorderRadius.all(Radius.circular(7))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   width: 30.w,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      child: Text(
                        data[index]["nama_surah"],
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RaleWay',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
