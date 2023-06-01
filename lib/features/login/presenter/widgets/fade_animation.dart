// import 'package:flutter/material.dart';
// import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
// import 'package:simple_animations/animation_builder/play_animation_builder.dart';
// import 'package:simple_animations/animation_builder/loop_animation_builder.dart';
// import 'package:simple_animations/animation_builder/mirror_animation_builder.dart';
// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   FadeAnimation(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final tween = Tween([
//       //Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//       //Track("translateY").add(
//         Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
//         curve: Curves.easeOut)
//     ]);

//     return ControlledAnimation(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: animation["opacity"],
//         child: Transform.translate(
//           offset: Offset(0, animation["translateY"]), 
//           child: child
//         ),
//       ),
//     );
//   }
// }