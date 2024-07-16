import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SlidStaggeredGridAnimation extends StatelessWidget {
  const SlidStaggeredGridAnimation({
    Key? key,
    required this.index,
    required this.child,
  }) : super(key: key);
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: 2,
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}

class SlidStaggeredListAnimation extends StatelessWidget {
  const SlidStaggeredListAnimation({
    Key? key,
    required this.index,
    required this.child,
  }) : super(key: key);
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
