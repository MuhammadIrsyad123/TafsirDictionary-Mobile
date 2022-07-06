// import 'package:flutter/material.dart';

// import '../../widgets/header.dart';

// class TanyaForum extends StatefulWidget {
//   static const String routeName = '/tanya';

//   const TanyaForum({Key? key}) : super(key: key);
//   static Route route() {
//     return MaterialPageRoute(
//       settings: const RouteSettings(name: routeName),
//       builder: (context) => const TanyaForum(),
//     );
//   }

//   @override
//   State<TanyaForum> createState() => _TanyaForumState();
// }

// class _TanyaForumState extends State<TanyaForum> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Header(
//         title: 'Pertanyaan',
//         appBar: AppBar(),
//       ),
//     );
//   }
// }

import 'package:tafsirdictionary/services/firestore_service.dart';
import 'package:tafsirdictionary/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/header.dart';

class TanyaForum extends StatefulWidget {
  static const String routeName = '/tanya';
  const TanyaForum({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const TanyaForum(),
    );
  }

  @override
  State<TanyaForum> createState() => _TanyaForumState();
}

class _TanyaForumState extends State<TanyaForum> {
  StorageServices storageServices = StorageServices();
  FireStoreService fireStoreService = FireStoreService();

  final namaController = TextEditingController();
  final tanyaController = TextEditingController();
  final jawapanController = TextEditingController();
  String username = '';

  @override
  Widget build(BuildContext context) {
    fireStoreService.getdata().then((value) {
      username = value.data()!["username"];
    });
    return Scaffold(
      appBar: Header(
        title: 'Pertanyaan',
        appBar: AppBar(),
      ),
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.comment),
            Text(
              'Masukkan Pertanyaan',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF9FA8DA), width: 2),
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9FA8DA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.w),
                        topRight: Radius.circular(20.w),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Pertanyaan',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.draw_rounded,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        TextFormField(
                          minLines: 3,
                          maxLines: null,
                          controller: tanyaController,
                          autofocus: false,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.multiline,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Sila isi ruangan pertanyaan");
                            }
                            // if (!regex.hasMatch(value)) {
                            //   return ("masukkan minimum 10 huruf");
                            // }
                            return null;
                          },
                          onSaved: (value) {
                            tanyaController.text = value!;
                          },
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 10),

                        const SizedBox(height: 10),
                        //TIPS

                        SizedBox(height: 10.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF4A148C)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Batal",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF4A148C)),
                                onPressed: () {
                                  addService();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hantar",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  void addService() async {
    EasyLoading.show(status: 'sedang diproses...');

    await fireStoreService.tanyanSoalan(
      tanyaController.text,
      jawapanController.text,
      namaController.text = username,
    );
    EasyLoading.showSuccess('Pertanyaan Telah Dihantar!');
    Navigator.of(context).pop();
  }
}
//  fireStoreService.getdata().then((value) {
//       username = value.data()!["name"];