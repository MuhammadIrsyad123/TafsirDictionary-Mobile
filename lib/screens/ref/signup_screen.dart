// import 'package:tafsirdictionary/config/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:tafsirdictionary/screens/screens.dart';
// import 'package:tafsirdictionary/providers/user.provider.dart';
// import 'package:provider/provider.dart';
// import 'package:tafsirdictionary/widgets/signup_form.dart';
// import 'package:tafsirdictionary/services/firestore_service.dart';

// import '../../widgets/loading-indicator.dart';

// // ignore: must_be_immutable
// class SignUpScreen extends StatelessWidget {
//   String role = "pengguna";

//   AppUser appUser = AppUser();
//   FireStoreService fireStoreService = FireStoreService();

//   SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final appUser = Provider.of<AppUser>(context);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 70,
//             ),
//             Padding(
//               padding: kDefaultPadding,
//               child: Text(
//                 'Cipta Akaun',
//                 style: titleText,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Padding(
//               padding: kDefaultPadding,
//               child: Row(
//                 children: [
//                   Text(
//                     'Sudah menjadi ahli?',
//                     style: subTitle,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginScreen()));
//                     },
//                     child: Text(
//                       'Log Masuk',
//                       style: textButton.copyWith(
//                         decoration: TextDecoration.underline,
//                         decorationThickness: 1,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Padding(
//               padding: kDefaultPadding,
//               child: SignUpForm(),
//             ),
//             const SizedBox(
//               height: 20,
//             ),

//             const SizedBox(
//               height: 20,
//             ),

//             Padding(
//               padding: kDefaultPadding,
//               child: GestureDetector(
//                 onTap: () async {
//                   try {
//                     LoadingIndicator.showLoadingDialog(context);

//                     await AppUser.instance.signUp(
//                       email: emailController.text,
//                       password: passwordController.text,
//                     );
//                     fireStoreService.createUserData(
//                       emailController.text,
//                       namaController.text,
//                       appUser.user!.uid,
//                       passwordController.text,
//                       role,
//                     );

//                     Navigator.pop(context);
//                     Navigator.pop(context);
//                   } catch (e) {
//                     Navigator.pop(context);
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             content: Text(e.toString()),
//                           );
//                         });
//                   }
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: MediaQuery.of(context).size.height * 0.08,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: kPrimaryColor),
//                   child: Text(
//                     'Daftar',
//                     style: textButton.copyWith(color: kWhiteColor),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // Padding(
//             //   padding: kDefaultPadding,
//             //   child: Text(
//             //     'Or log in with:',
//             //     style: subTitle.copyWith(color: kBlackColor),
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: 20,
//             // ),
//             const Padding(
//               padding: kDefaultPadding,
//               // child: LoginOption(),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
