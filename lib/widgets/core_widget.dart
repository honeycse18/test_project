import 'package:flutter/material.dart';
import 'package:test_project/utils/constants/colors.dart';

// class CustomScaffold extends StatelessWidget {
//   // final Widget child;
//   final bool showBottomSection;

//   const CustomScaffold({
//     super.key,
//     //  required this.child,
//     this.showBottomSection = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Bottom section
//           if (showBottomSection)
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ClipPath(
//                 clipper: CustomWaveClipper(),
//                 child: Container(
//                   height: 250,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.blue, Colors.green],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // const Text(
//                       //   'Welcome',
//                       //   style: TextStyle(
//                       //     fontSize: 22,
//                       //     fontWeight: FontWeight.bold,
//                       //     color: Colors.white,
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 8),
//                       // const Text(
//                       //   '— Log in using Fingerprint —',
//                       //   style: TextStyle(
//                       //     fontSize: 16,
//                       //     fontWeight: FontWeight.w500,
//                       //     color: Colors.white,
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 6),
//                       // const Text(
//                       //   'Place your finger on fingerprint scanner to login',
//                       //   style: TextStyle(
//                       //     fontSize: 14,
//                       //     color: Colors.white70,
//                       //   ),
//                       //   textAlign: TextAlign.center,
//                       // ),
//                       // const SizedBox(height: 16),
//                       // const Icon(
//                       //   Icons.fingerprint,
//                       //   size: 50,
//                       //   color: Colors.white,
//                       // ),
//                       // const SizedBox(height: 16),
//                       // const Text(
//                       //   'SWIPE UP TO LOGIN WITH EMAIL',
//                       //   style: TextStyle(
//                       //     fontSize: 14,
//                       //     fontWeight: FontWeight.w600,
//                       //     color: Colors.white,
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// Custom Clipper for the wave effect
class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 60);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height - 120, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomScaffold extends StatelessWidget {
  PreferredSizeWidget? appBar;
  final Widget? body;
  Widget? bottomSheet;
  Color? backgroundColor;

  CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomSheet,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: appBar,
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                bottom: 0,
                child: Image.asset('assets/images/all_bottom_design.png')),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenWidth,
                    child: body,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      bottomSheet: bottomSheet,
      key: key,
    );
  }
}
