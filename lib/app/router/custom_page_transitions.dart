import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

Page<dynamic> iosPage({required LocalKey key, required Widget child}) {
  return CustomTransitionPage<dynamic>(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondary, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: Curves.easeOutCubic));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
