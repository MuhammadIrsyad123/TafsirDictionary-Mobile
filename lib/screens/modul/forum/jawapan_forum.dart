// import 'package:flutter/material.dart';
// import 'package:tafsirdictionary/widgets/header.dart';

// class JawapanForum extends StatefulWidget {
//   static const String routeName = '/jawapan';
//   const JawapanForum({Key? key}) : super(key: key);

//   static Route route() {
//     return MaterialPageRoute(
//       settings: const RouteSettings(name: routeName),
//       builder: (context) => const JawapanForum(),
//     );
//   }

//   @override
//   State<JawapanForum> createState() => _JawapanForumState();
// }

// class _JawapanForumState extends State<JawapanForum> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Header(
//         title: 'Jawapan',
//         appBar: AppBar(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafsirdictionary/widgets/header.dart';

class JawapanForum extends StatefulWidget {
  final Map<String, dynamic> data;

  const JawapanForum({Key? key, required this.data}) : super(key: key);

  @override
  State<JawapanForum> createState() => _JawapanForumState();
}

class _JawapanForumState extends State<JawapanForum> {
  bool visible = false;

  bool liked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Jawapan',
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.all(20.w),
              // color: Color.fromARGB(255, 163, 130, 130),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Soalan',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["kandungansoalan"],
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Jawapan',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                )
              ]),
            ),

            //content keterangan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["jawapan"],
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ),

            //header tips

            //content tips

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
