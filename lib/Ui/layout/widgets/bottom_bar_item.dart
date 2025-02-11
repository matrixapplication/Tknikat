import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';

class BottomBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int index;
  final String image;
  final Function(int index) onChange;
  const BottomBarItem({Key? key, required this.title, required this.image, required this.onChange, this.isSelected=false, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onChange.call(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image,color: isSelected==true?primaryColor:Colors.black.withOpacity(0.8),),
          BlackRegularText(label: title,fontSize: 16,fontWeight: FontWeight.w300,labelColor:  isSelected==true?primaryColor:Colors.black.withOpacity(0.8),)
        ],
      ),
    );
  }
}
