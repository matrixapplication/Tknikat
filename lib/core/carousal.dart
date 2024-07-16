import 'package:flutter/material.dart';

class Carousal extends StatelessWidget {
  final List<Widget> recevedData;
  final double maxCrossAxisExtent;
  final double childAspectRatio;

  Carousal(this.recevedData,
      {required this.maxCrossAxisExtent, required this.childAspectRatio});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(13),
      children: recevedData,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 13,
        mainAxisSpacing: 13,
      ),
      // physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
    );
  }
}
