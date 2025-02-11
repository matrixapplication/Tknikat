
import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';



class ItemPickedImage extends StatelessWidget {
  final String? _path;
  final GestureTapCallback? _onRemovePressed;
  const ItemPickedImage({
    required String? path,
    required GestureTapCallback? onRemovePressed,
  })  : _path = path,
        _onRemovePressed = onRemovePressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: _onRemovePressed,
      child: Container(
        decoration: const BoxDecoration(),
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network( _path??'', height: 150.h,errorBuilder: (d,t,k){
              return Center(child: Icon(Icons.warning),);
            },),
            Visibility(visible: _onRemovePressed != null, child: Container(  decoration:  BoxDecoration(color: Colors.white.withOpacity(0.3),),)),
            Visibility(visible: _onRemovePressed != null, child: const Icon(Icons.clear, color: Colors.white, size: 12)),
          ],
        ),
      ),
    );
  }
}
