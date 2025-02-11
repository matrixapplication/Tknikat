import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';

class CustomLoadingSpinner extends StatelessWidget {
  final Color? color;
  final double? size;
  const CustomLoadingSpinner({Key? key,
    this.color,
    this.size,
  }) : super();


  @override
  Widget build(BuildContext context) {
  return Center(
    child: SizedBox(
      height: (size??24).r,
      width: (size??24).r,
      child: SpinKitDoubleBounce(color: color??Theme.of(context).primaryColor,size: 35,),
      // child:  CircularProgressIndicator(strokeWidth: 3.w,color: color,),
    ),
  );
  }


}
