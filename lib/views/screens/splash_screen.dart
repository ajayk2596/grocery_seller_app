// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     Timer(Duration(seconds: 3), () {
//       Get.offAll(() => HomeScreen());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.greenAccent, // Background color for splash screen
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Using Flutter Icon instead of Image
//             Icon(
//               Icons.shopping_cart, // You can choose any icon that represents a grocery theme
//               size: 100, // Adjust the size of the icon as needed
//               color: Colors.white, // Icon color
//             ),
//             SizedBox(height: 20),
//             // App Name (Optional)
//             Text(
//               'Grocery Seller',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20),
//             // Loading Indicator (Optional)
//             CircularProgressIndicator(
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
