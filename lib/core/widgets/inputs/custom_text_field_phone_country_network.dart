// import 'package:flutter/material.dart';
//
// import '../texts/black_texts.dart';
//
// class CustomTextFieldPhoneCountryNetwork extends StatelessWidget {
//   final _tag = 'CustomTextFieldPhoneCountryNetwork';
//   final Function(CountryEntity)? _onSelected;
//   final CountryEntity? _selectedValue;
//   final String? _error;
//   final String? _title;
//   final IconData? _iconData;
//   final String? _iconSVG;
//   final String? _defaultValue;
//   final bool _isDark;
//   final TextEditingController? _controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _title!=null?
//         Padding(padding: 8.paddingBottom+5.paddingStart,
//           child:  BlackRegularText(label: _title??'',fontSize: 16.sp,fontWeight: FontWeight.w300,),
//         ):const SizedBox.shrink(),
//
//         CustomTextFieldPhone(
//           label: tr(LocaleKeys.yourPhoneNumber),
//           controller: _controller,
//           defaultValue: _defaultValue,
//           autofocus: true,
//           textInputAction: TextInputAction.next,
//           prefixWidget: _buildFlagsButton(context),
//
//         ),
//         _buildErrorView(context),
//       ],
//     );
//
//
//   }
//
//   Future<void> _onPressed(BuildContext context,) async {
//     var result = await showCountryPicker(
//       context,
//       isMultiChoice: false,
//       defaultList:[],
//       defaultValue: _selectedValue,
//     );
//
//
//     log(_tag, 'onPressed: result= $result');
//     FocusManager.instance.primaryFocus?.unfocus();
//
//     if (result != null) {
//       if (_onSelected != null) {
//         _onSelected!(result);
//       }
//     } else {
//       log(_tag, 'result == null');
//     }
//   }
//
//   DecoratedBox _buildFlagsButton(BuildContext context) {
//     return DecoratedBox(
//       decoration: const BoxDecoration(),
//       child: InkWell(
//         // borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
//         onTap: ()=>_onPressed(context),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // if (widget.enabled && widget.showDropdownIcon && widget.dropdownIconPosition == IconPosition.leading) ...[
//             //   widget.dropdownIcon,
//             //   const SizedBox(width: 4),
//             // ],
//             const Icon(Icons.arrow_drop_down),
//             if (_selectedValue!=null) ...[
//               CustomImage(imageUrl: _selectedValue?.image,width: 42,height: 32 ,radius: 8,showBorder:false,),
//               const SizedBox(width: 8),
//               FittedBox(
//                 child: Text('+${_selectedValue?.code??''}'),
//               ),
//
//             ]else...[
//               CustomImage(imageUrl: _selectedValue?.image,width: 42,height: 32 ,radius: 8,showBorder:false,),
//
//               // Center(child: Text(tr(LocaleKeys.country))),
//             ],
//             //
//             // if (widget.enabled &&
//             //     widget.showDropdownIcon &&
//             //     widget.dropdownIconPosition == IconPosition.trailing) ...[
//             //   const SizedBox(width: 4),
//             //   widget.dropdownIcon,
//             // ],
//             const SizedBox(width: 8),
//           ],
//         ),
//       ),
//     );
//   }
//   _buildErrorView(BuildContext context) {
//     return _error != null
//         ? Column(
//       children: [
//         Row(
//           children: [
//             const SizedBox(width: 16),
//             Text(_error ?? '', style: Theme.of(context).inputDecorationTheme.errorStyle?.copyWith(color: Theme.of(context).errorColor),),
//           ],
//         )
//       ],
//     )
//         : const SizedBox.shrink();
//   }
//
//   const CustomTextFieldPhoneCountryNetwork({super.key,
//      Function(CountryEntity)? onSelected,
//      CountryEntity? selectedValue,
//      String? error,
//      IconData? iconData,
//      String? iconSVG,
//      String? title,
//      String? defaultValue,
//      bool isDark= false,
//      TextEditingController? controller,
//   })  : _onSelected = onSelected,
//         _selectedValue = selectedValue,
//         _error = error,
//         _title = title,
//         _iconData = iconData,
//         _iconSVG = iconSVG,
//         _defaultValue = defaultValue,
//         _isDark = isDark,
//         _controller = controller;
// }
