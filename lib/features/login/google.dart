//
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class LoginSrc extends StatefulWidget {
//   const LoginSrc({super.key});
//
//   @override
//   State<LoginSrc> createState() => _LoginSrcState();
// }
//
// class _LoginSrcState extends State<LoginSrc> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 // GoogleAuthService().signIn();
//
//               },
//               child: Text("Google Login"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class GoogleAuthService {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//       'profile',
//       'openid',
//     ],
//     // clientId: 'YOUR_CLIENT_ID', // Only needed for web sometimes
//   );
//
//   Future<void> signIn() async {
//     try {
//       final GoogleSignInAccount? account = await _googleSignIn.signIn();
//       if (account != null) {
//         final GoogleSignInAuthentication auth = await account.authentication;
//         print('Access Token: ${auth.accessToken}');
//         print('ID Token: ${auth.idToken}');
//       }
//     } catch (error) {
//       print('Error during Google Sign-In: $error');
//     }
//   }
//
//   Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     print('User signed out.');
//   }
//
// }