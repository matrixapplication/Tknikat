import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/style/styles.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';

import '../constent.dart';
import '../style/custom_loader.dart';
import 'custom_loading_spinner.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? _onTap;
  final Widget? _child;
  final String? _title;
  final Color? _color;
  final Color? _textColor;
  final double? _width;
  final double? _raduis;
  final double? _height;
  final double? _fontSize;
  final bool _isRounded;
  final bool _isOutlined;
  final bool _widerPadding;
  final bool _loading;
  final bool _boxShadow;
  final bool _expanded;
  final double? _elevation;
  final bool _enable;
  final EdgeInsetsGeometry? _padding;

  const CustomButton({
    required VoidCallback? onTap,
    Widget? child,
    String? title,
    Color? color,
    Color? textColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    double? width,
    double? fontSize,
    double? raduis,
    double? height,
    bool isRounded= true,
    bool boxShadow= false,
    bool enable= true,
    bool isOutlined= false,
    bool widerPadding= false,
    bool loading= false,
    bool expanded= true,
  })  : _onTap = onTap,
        _child = child,
        _title = title,
        _expanded = expanded,
        _padding = padding,
        _boxShadow = boxShadow,
        _color = color,
        _elevation = elevation,
        _raduis = raduis,
        _textColor = textColor,
        _width = width,
        _fontSize = fontSize,
        _enable = enable,
        _height = height,
        _isRounded = isRounded,
        _isOutlined = isOutlined,
        _widerPadding = widerPadding,
        _loading = loading;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:_padding,
      decoration: BoxDecoration(
          color: _color??primaryColor,
          borderRadius: _isRounded?BorderRadius.circular(_raduis??16):null,
          boxShadow: [
            _boxShadow==false?const BoxShadow():
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ]
      ),
      width:_expanded?(_width??double.infinity):null ,
      height: (_height??44).h,
      child: CustomTapEffect(
        onTap: (!_enable||_loading)?null:_onTap,

        child: MaterialButton(

          color: _isOutlined==true ? Colors.white :( _color??primaryColor),
          highlightElevation: 0,
          onPressed: (!_enable||_loading)?(){}: _onTap,
          padding: !_widerPadding ? EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w) : EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          elevation: _elevation??0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_raduis?? 16), side: BorderSide(color: _color ?? primaryColor, width: 1.5.w)),
          child: _loading
              ?
            loader(context: context,color:_isOutlined==true?primaryColor: Colors.white)
          // CustomLoadingSpinner( size: (_height ?? 20).h,color: Theme.of(context).cardColor)
              :_title!=null?Center(child: Text(_title!,style:
          TextStyles.font16Regular.copyWith(color: _textColor??(_isOutlined==true?primaryColor:Colors.white),fontSize: 16),),): _child??const SizedBox(),
        ),
      ),
    );
  }

}
