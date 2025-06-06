import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';

class CircularMenuItem extends StatelessWidget {
  /// if icon and animatedIcon are passed, icon will be ignored
  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final VoidCallback onTap;
  final double iconSize;
  final double padding;
  final double margin;
  final List<BoxShadow>? boxShadow;
  final bool enableBadge;
  final double? badgeRightOffet;
  final double? badgeLeftOffet;
  final double? badgeTopOffet;
  final double? badgeBottomOffet;
  final double? badgeRadius;
  final TextStyle? badgeTextStyle;
  final String? image;
  final String? badgeLabel;
  final Color? badgeTextColor;
  final Color? badgeColor;

  /// if animatedIcon and icon are passed, icon will be ignored
  final AnimatedIcon? animatedIcon;

  /// creates a menu item .
  /// [onTap] must not be null.
  /// [padding] and [margin]  must be equal or greater than zero.
  CircularMenuItem({
    required this.onTap,
    this.icon,
    this.color,
    this.iconSize = 30,
    this.boxShadow,
    this.iconColor,
    this.animatedIcon,
    this.image,
    this.padding = 10,
    this.margin = 10,
    this.enableBadge = false,
    this.badgeBottomOffet,
    this.badgeLeftOffet,
    this.badgeRightOffet,
    this.badgeTopOffet,
    this.badgeRadius,
    this.badgeTextStyle,
    this.badgeLabel,
    this.badgeTextColor,
    this.badgeColor,
  })  : assert(padding >= 0.0),
        assert(margin >= 0.0);

  Widget _buildCircularMenuItem(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.all(margin),
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: color ?? Theme.of(context).primaryColor,
                    blurRadius: 10,
                  ),
                ],
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Material(
              color: color ?? Theme.of(context).primaryColor,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: animatedIcon == null
                      ? image != null
                          ? SvgPicture.asset(
                              image!,
                              color: Colors.white,
                            )
                          : Icon(
                              icon,
                              size: iconSize,
                              color: iconColor ?? Colors.white,
                            )
                      : animatedIcon,
                ),
                onTap: onTap,
              ),
            ),
          ),
        ),
        Container(
          width: 70.w,
          padding: 2.paddingVert,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(2,4
                )
              )
            ]
          ),
          child: Container(
            child: Center(
              child: BlackRegularText(label:badgeLabel??'',fontSize: 12,fontWeight: FontWeight.w400,),
            )
          )
        )
      ],
    );
  }

  Widget _buildCircularMenuItemWithBadge(BuildContext context) {
    return _Badge(
      color: badgeColor,
      bottomOffset: badgeBottomOffet,
      rightOffset: badgeRightOffet,
      leftOffset: badgeLeftOffet,
      topOffset: badgeTopOffet,
      radius: badgeRadius,
      textStyle: badgeTextStyle,
      onTap: onTap,
      textColor: badgeTextColor,
      label: badgeLabel,
      child: _buildCircularMenuItem(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return enableBadge
        ? _buildCircularMenuItemWithBadge(context)
        : _buildCircularMenuItem(context);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    Key? key,
    required this.child,
    required this.label,
    this.color,
    this.textColor,
    this.onTap,
    this.radius,
    this.bottomOffset,
    this.leftOffset,
    this.rightOffset,
    this.topOffset,
    this.textStyle,
  }) : super(key: key);

  final Widget child;
  final String? label;
  final Color? color;
  final Color? textColor;
  final Function? onTap;
  final double? rightOffset;
  final double? leftOffset;
  final double? topOffset;
  final double? bottomOffset;
  final double? radius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          right: (leftOffset == null && rightOffset == null) ? 8 : rightOffset,
          top: (topOffset == null && bottomOffset == null) ? 8 : topOffset,
          left: leftOffset,
          bottom: bottomOffset,
          child: FittedBox(
            child: GestureDetector(
              onTap: onTap as void Function()? ?? () {},
              child: CircleAvatar(
                maxRadius: radius ?? 10,
                minRadius: radius ?? 10,
                backgroundColor: color ?? Theme.of(context).primaryColor,
                child: FittedBox(
                  child: Text(
                    label ?? '',
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        TextStyle(
                            fontSize: 10,
                            color: textColor ??
                                Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
