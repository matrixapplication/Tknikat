
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/inputs/base_form.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';

import '../../../app_localizations.dart';
import '../../custom_radio.dart';
import '../../texts/black_texts.dart';
import '../custom_text_field_search.dart';
import 'countries.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country2> countryList;
  final Country2 selectedCountry;
  final ValueChanged<Country2> onCountryChanged;
  final String searchText;
  final List<Country2> filteredCountries;
  final PickerDialogStyle? style;

  const CountryPickerDialog({
    Key? key,
    required this.searchText,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    this.style,
  }) : super(key: key);

  @override
  _CountryPickerDialogState createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country2> _filteredCountries;
  late Country2 _selectedCountry;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final mediaWidth = MediaQuery.of(context).size.width;
    // final width = widget.style?.width ?? mediaWidth;
    // const defaultHorizontalPadding = 24.0;
    // const defaultVerticalPadding = 40.0;
    return Container(
      decoration: BoxDecoration(
        color: widget.style?.backgroundColor??Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      padding: widget.style?.padding ?? const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
            8.height,
            Center(child: SvgPicture.asset(AppImages.rec),),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                50.width,
                BlackMediumText(label:getLangLocalization('selectCountry'),fontSize: 16,),
                IconWidget(
                  onTap: (){context.pop();},
                  padding: 8,
                  widget: SvgPicture.asset(AppImages.close),
                )
              ],
            ),
          24.height,

          Padding(
            padding: widget.style?.searchFieldPadding ?? const EdgeInsets.all(0),
            child: CustomTextField(
              // isDark: true,
              background:Color(0xffF7F7F8),
                prefixIcon: Icons.search,
                prefixIconColor: Colors.grey,
                borderColor: Colors.transparent,
                hint:AppLocalizations.of(context).translate("search"),
              onChange: (value) {
                _filteredCountries = isNumeric(value)
                    ? widget.countryList
                    .where((country) => country.dialCode.contains(value))
                    .toList()
                    : widget.countryList
                    .where((country) =>
                country.name.toLowerCase().contains(value.toLowerCase()) ||
                    country.nameAr.contains(value)) // البحث بالعربي كمان
                    .toList();
                if (mounted) setState(() {});
              },
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredCountries.length,
              itemBuilder: (ctx, index) {
                 bool isSelected =_selectedCountry == _filteredCountries[index];
                return
                  Column(
                  children: <Widget>[
                    CustomTapEffect(onTap: (){
                      setState(() {
                        _selectedCountry = _filteredCountries[index];
                      });
                    }, child:    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: isSelected?primaryColor:Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          color: isSelected?Color(0xffF2F9FD):null
                      ),
                      margin: 6.paddingVert,
                      padding: 20.paddingEnd,
                      child: Row(
                        children: [
                          Expanded(child: Container(
                            padding: EdgeInsets.all(12.r),
                            decoration: const BoxDecoration(),
                            child: Row(
                              children: [
                                Image.asset('assets/images/flags/${_filteredCountries[index].code.toLowerCase()}.png', width: 24),
                                12.width,
                                BlackRegularText(label: '+${_filteredCountries[index].dialCode}'),

                                12.width,
                                Expanded(child: BlackRegularText(label:
                                Localizations.localeOf(context).languageCode == 'ar'
                                    ? _filteredCountries[index].nameAr
                                    : _filteredCountries[index].name,
                                maxLines: 1,),),
                              ],
                            ),
                          )),
                          CustomRadio(
                              value: _selectedCountry,
                              groupValue: _filteredCountries[index],
                              onChanged: (v) {
                                setState(() {
                                  _selectedCountry = _filteredCountries[index];
                                });
                              }),
                        ],
                      ),
                    ),),
                    // ListTile(leading: Image.asset('assets/images/flags/${_filteredCountries[index].code.toLowerCase()}.png', width: 32),
                    //   contentPadding: widget.style?.listTilePadding,
                    //   title: Text(_filteredCountries[index].name, style: widget.style?.countryNameStyle ?? const TextStyle().semiBoldStyle().colorBlack(),),
                    //   trailing: Text('+${_filteredCountries[index].dialCode}', style: widget.style?.countryCodeStyle ?? const TextStyle().regularStyle()),
                    //   onTap: () {
                    //     _selectedCountry = _filteredCountries[index];
                    //     widget.onCountryChanged(_selectedCountry);
                    //     Navigator.of(context).pop();
                    //   },
                    // ),


                    widget.style?.listTileDivider ??const SizedBox(),
                  ],
                );

              }

            ),
          ),
          const SizedBox(height: 20),

          CustomButton(title:getLangLocalization('confirm'),onTap: (){
            widget.onCountryChanged(_selectedCountry);
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }
  /// check if the string [str] contains only numbers
  static bool isNumeric(String str) {
    final RegExp numeric =  RegExp(r'^-?[0-9]+$');

    return numeric.hasMatch(str);
  }
}

// showChangeCountry({
//   Key? key,
//   required this.searchText,
//   required this.countryList,
//   required this.onCountryChanged,
//   required this.selectedCountry,
//   required this.filteredCountries,
//   this.style,
// })=>ModalSheet.showModalSheet(context: context, screen: screen)