import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/header.dart';

class KandunganContoh extends StatefulWidget {
  final Map<String, dynamic> data;
  static const String routeName = '/kandungan_contoh';
  const KandunganContoh({Key? key, required this.data}) : super(key: key);

  @override
  State<KandunganContoh> createState() => _KandunganContohState();
}

class _KandunganContohState extends State<KandunganContoh> {
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
        title: (widget.data["nama_surah"]),
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
              padding: const EdgeInsets.all(1),
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["kandungansurah"],
                      style: TextStyle(fontSize: 25.sp),
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
                    'Tafsiran yang sahih',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 300.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFECEFF1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["sahih"],
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
                    'Tafsiran yang tidak sahih',
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
                    color: Color(0xFFECEFF1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.data["taksahih"],
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
