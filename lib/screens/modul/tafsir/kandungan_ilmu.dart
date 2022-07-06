import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../widgets/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KandunganIlmu extends StatefulWidget {
  final Map<String, dynamic> data;
  static const String routeName = '/kandungan_ilmu';
  const KandunganIlmu({Key? key, required this.data}) : super(key: key);

  @override
  State<KandunganIlmu> createState() => _KandunganIlmuState();
}

class _KandunganIlmuState extends State<KandunganIlmu> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool loading = true;

  List<Map<String, dynamic>> services = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: (widget.data["nama_tafsir"]),
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

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
              child: Row(
                children: [
                  Text(
                    'Definisi',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["definisi"],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
              child: Row(
                children: [
                  Text(
                    'Kitab yang menggunakan metode ini',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),

            //content keterangan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 300.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["contohkitab"],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
              child: Row(
                children: [
                  Text(
                    'Cara Tafsiran',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),

            //content keterangan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 300.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["caratafsiran"],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
              child: Row(
                children: [
                  Text(
                    'Latar Belakang Metode',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),

            //content keterangan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 300.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["sejarah"],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
              child: Row(
                children: [
                  Text(
                    'Kesahihan',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),

            //content keterangan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["kesahihan"],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    await FirebaseFirestore.instance
        .collection("ilmu_tafsir")
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
