
import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/custom_button.dart';

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
    final mediaWidth = MediaQuery.of(context).size.width;
    final width = widget.style?.width ?? mediaWidth;
    const defaultHorizontalPadding = 24.0;
    const defaultVerticalPadding = 40.0;
    return Container(
      decoration: BoxDecoration(
        color: widget.style?.backgroundColor??Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: widget.style?.padding ?? const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Padding(
            padding: widget.style?.searchFieldPadding ?? const EdgeInsets.all(0),
            child: CustomTextFieldSearch(
              // isDark: true,
              onChange: (value) {
                _filteredCountries = isNumeric(value)
                    ? widget.countryList
                    .where((country) => country.dialCode.contains(value))
                    .toList()
                    : widget.countryList
                    .where((country) => country.name
                    .toLowerCase()
                    .contains(value.toLowerCase()))
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
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  Row(
                    children: [
                      CustomRadio(
                          value: _selectedCountry,
                          groupValue: _filteredCountries[index],
                          onChanged: (v) {
                            setState(() {
                              _selectedCountry = _filteredCountries[index];
                            });
                          }),
                      // Radio(
                      //            value: _selectedCountry,
                      //            groupValue: _filteredCountries[index],
                      //            onChanged: (v) {
                      //              setState(() {
                      //                _selectedCountry = _filteredCountries[index];
                      //              });
                      //            }),

                      // HorizontalSpace(kFormPaddingAllLarge.h),
                      Expanded(child: Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: const BoxDecoration(),
                        child: Row(
                          children: [
                            Image.asset('assets/images/flags/${_filteredCountries[index].code.toLowerCase()}.png', width: 24),
                            12.width,
                            BlackRegularText(label: '+${_filteredCountries[index].dialCode}'),

                            12.width,
                            BlackRegularText(label: _filteredCountries[index].name)
                          ],
                        ),
                      ))
                    ],
                  ),
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
              ),
            ),
          ),
          const SizedBox(height: 20),

          CustomButton(title: 'Confirm',onTap: (){
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