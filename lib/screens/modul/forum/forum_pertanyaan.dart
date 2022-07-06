// import 'package:flutter/material.dart';
// import 'package:tafsirdictionary/screens/modul/jawapan_forum.dart';
// import 'package:tafsirdictionary/widgets/header.dart';
// import '../../config/constants.dart';
// import 'hantar_pertanyaan.dart';

// class ForumPertanyaan extends StatefulWidget {
//   static const String routeName = '/forum_pertanyaan';
//   const ForumPertanyaan({Key? key}) : super(key: key);

//   static Route route() {
//     return MaterialPageRoute(
//       settings: const RouteSettings(name: routeName),
//       builder: (context) => const ForumPertanyaan(),
//     );
//   }

//   @override
//   State<ForumPertanyaan> createState() => _ForumPertanyaanState();
// }

// class _ForumPertanyaanState extends State<ForumPertanyaan> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Header(
//         title: 'Forum Pertanyaan',
//         appBar: AppBar(),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           children: const <Widget>[
//             ForumText(),
//             LihatJawapan(),
//             HantarPertanyaan(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ForumText extends StatelessWidget {
//   const ForumText({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       width: 320,
//       child: TextField(
//         enabled: false,
//       ),
//     );
//   }
// }

// class LihatJawapan extends StatelessWidget {
//   const LihatJawapan({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const JawapanForum(),
//           ),
//         );
//       },
//       child: Text(
//         'Lihat Jawapan.',
//         style: textButton.copyWith(
//           decoration: TextDecoration.underline,
//           decorationThickness: 1,
//         ),
//       ),
//     );
//   }
// }

// class HantarPertanyaan extends StatelessWidget {
//   const HantarPertanyaan({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: SizedBox(
//         width: width * 0.7,
//         height: height * 0.06,
//         child: MaterialButton(
//           shape: const StadiumBorder(),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const TanyaForum(),
//               ),
//             );
//           },
//           child: Text(
//             "Hantar Pertanyaan",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: height * 0.023,
//                 fontWeight: FontWeight.w800),
//           ),
//           color: const Color(0xFF4A148C),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafsirdictionary/screens/modul/forum/hantar_pertanyaan.dart';
import 'package:tafsirdictionary/screens/modul/forum/jawapan_forum.dart';
import 'package:tafsirdictionary/widgets/popup.dart';
import '../../../../widgets/header.dart';

class ForumPertanyaan extends StatefulWidget {
  static const String routeName = '/forum_pertanyaan';
  const ForumPertanyaan({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ForumPertanyaan(),
    );
  }

  @override
  State<ForumPertanyaan> createState() => _ForumPertanyaanState();
}

class _ForumPertanyaanState extends State<ForumPertanyaan> {
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
      //Floating action button sunting
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'soalan_hero',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TanyaForum()));
        },
        label: const Text("Hantar Pertanyaan"),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFF4A148C),
      ),
      //appbar
      appBar: Header(
        title: 'Forum Pertanyaan',
        appBar: AppBar(),
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
                          if (services[index]["jawapan"] == '') {
                            showNoJawapanDialog(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => JawapanForum(
                                  data: services[index],
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 1, 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      services[index]["username"],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(children: [
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(1, 40, 1, 1)),
                                      Expanded(
                                        child: Text(
                                          services[index]["kandungansoalan"],
                                          maxLines: 1,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ),
                                    ]),
                                  ]),
                            )
                            //  Text(
                            //     services[index]["username"],
                            //     style: const TextStyle(
                            //         fontSize: 20, fontWeight: FontWeight.bold),
                            //   ),
                            //   Text(
                            //     services[index]["kandungansoalan"],
                            //     maxLines: 1,
                            //     softWrap: true,
                            //     overflow: TextOverflow.ellipsis,
                            //     style: TextStyle(fontSize: 15.sp),
                            // ),
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
        .collection("tanya_soalan")
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

// @override
// Widget buildResults(BuildContext context) {
//   List data = [];

//   return ListView.builder(
//     itemCount: data.length,
//     itemBuilder: (context, index) {
//       return GestureDetector(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (c) => JawapanForum(
//                         data: data[index],
//                       )));
//         },
//         child: Container(
//           margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
//           height: 100,
//           decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 216, 192, 161),
//               borderRadius: BorderRadius.all(Radius.circular(20))),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 50.w,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text(
//                     'Soalan',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Row(children: [
//                     const Icon(Icons.calendar_month_rounded),
//                     Text(
//                       data[index]["kandungansoalan"],
//                       maxLines: 1,
//                       softWrap: true,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ]),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
