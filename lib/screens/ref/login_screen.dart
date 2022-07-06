// import 'package:tafsirdictionary/widgets/loading-indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:tafsirdictionary/screens/screens.dart';
// import 'package:tafsirdictionary/config/constants.dart';
// import 'package:tafsirdictionary/widgets/login_form.dart';
// import 'package:tafsirdictionary/providers/user.provider.dart';

// import '../../providers/user.provider.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: kDefaultPadding,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               // Center(child: Image.asset('assets/emasjid.png')),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Selamat Datang! ',
//                     style: subTitle,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignUpScreen(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Daftar akaun.',
//                       style: textButton.copyWith(
//                         decoration: TextDecoration.underline,
//                         decorationThickness: 1,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const LogInForm(),
//               const SizedBox(
//                 height: 20,
//               ),

//               const SizedBox(
//                 height: 20,
//               ),

//               GestureDetector(
//                 onTap: () async {
//                   try {
//                     LoadingIndicator.showLoadingDialog(context);
//                     AppUser.instance.signIn(
//                         email: emailController.text,
//                         password: passwordController.text);
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
//                     'Log Masuk',
//                     style: textButton.copyWith(color: kWhiteColor),
//                   ),
//                 ),
//               ),

//               const SizedBox(
//                 height: 20,
//               ),
//               // Text(
//               //   'Or log in with:',
//               //   style: subTitle.copyWith(color: kBlackColor),
//               // ),
//               // SizedBox(
//               //   height: 20,
//               // ),
//               // LoginOption(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
