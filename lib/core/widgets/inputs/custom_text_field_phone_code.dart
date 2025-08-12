
import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/style/styles.dart';

import '../../filters/filter_class.dart';
import '../modal_sheet.dart';
import '../texts/black_texts.dart';
import 'base_form.dart';
import 'country/countries.dart';
import 'country/country_picker_dialog.dart';
import 'country/phone_number_model.dart';



class CustomTextFieldPhoneCode extends StatefulWidget {


  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;

  final bool noBorder;
  final bool isRequired;
  final bool enable;

  final int? lines;
  final int? maxLength;

  final double? fontSize;
  final double? radius;
  final double? contentPaddingH;


  final Widget? icon;
  final Widget? suffixData;

  final IconData? iconData;
  final IconData? suffixIconData;

  final Color? background;

  final ValueChanged<String>? onChange;
  final Function? validateFunc;
  final Function? onSubmit;





  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  final bool isCountryEditable;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// How the text should be aligned vertically.
  final VoidCallback? onTap;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;
  final FormFieldSetter<PhoneNumber>? onSaved;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * [formatter], which are called before [onChanged]
  ///    runs and can validate and change ("format") the input value.
  ///  * [onEditingComplete], [onSubmitted], [onSelectionChanged]:
  ///    which are more specialized input change notifications.
  final ValueChanged<PhoneNumber>? onChanged;

  final ValueChanged<Country2>? onCountryChanged;

  //on click update
  final VoidCallback? onUpdate;

  /// An optional method that validates an input. Returns an error string to display if the input is invalid, or null otherwise.
  ///
  /// A [PhoneNumber] is passed to the validator as argument.
  /// The validator can handle asynchronous validation when declared as a [Future].
  /// Or run synchronously when declared as a [Function].
  ///
  /// By default, the validator checks whether the input number length is between selected country's phone numbers min and max length.
  /// If `disableLengthCheck` is not set to `true`, your validator returned value will be overwritten by the default validator.
  /// But, if `disableLengthCheck` is set to `true`, your validator will have to check phone number length itself.
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType keyboardType;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  ///
  /// The [focusNode] is a long-lived object that's typically managed by a
  /// [StatefulWidget] parent. See [FocusNode] for more information.
  ///
  /// To give the keyboard focus to this widget, provide a [focusNode] and then
  /// use the current [FocusScope] to request_body the focus:
  ///
  /// ```dart
  /// FocusScope.of(context).requestFocus(myFocusNode);
  /// ```
  ///
  /// This happens automatically when the widget is tapped.
  ///
  /// To be notified when the widget gains or loses the focus, add a listener
  /// to the [focusNode]:
  ///
  /// ```dart
  /// focusNode.addListener(() { print(myFocusNode.hasFocus); });
  /// ```
  ///
  /// If null, this widget will create its own [FocusNode].
  ///
  /// ## Keyboard
  ///
  /// Requesting the focus will typically cause the keyboard to be shown
  /// if it's not showing already.
  ///
  /// On Android, the user can hide the keyboard - without changing the focus -
  /// with the system back button. They can restore the keyboard's visibility
  /// by tapping on a text field.  The user might hide the keyboard and
  /// switch to a physical keyboard, or they might just need to get it
  /// out of the way for a moment, to expose something it's
  /// obscuring. In this case requesting the focus again will not
  /// cause the focus to change, and will not make the keyboard visible.
  ///
  /// This widget builds an [EditableText] and will ensure that the keyboard is
  /// showing when it is tapped by calling [EditableTextState.requestKeyboard()].

  /// {@macro flutter.widgets.editableText.onSubmitted}
  ///
  /// See also:
  ///
  ///  * [EditableText.onSubmitted] for an example of how to handle moving to
  ///    the next/previous field when using [TextInputAction.next] and
  ///    [TextInputAction.previous] for [textInputAction].
  final void Function(String)? onSubmitted;

  /// If false the widget is "disabled": it ignores taps, the [TextFormField]'s
  /// [decoration] is rendered in grey,
  /// [decoration]'s [InputDecoration.counterText] is set to `""`,
  /// and the drop down icon is hidden no matter [showDropdownIcon] value.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [Decoration.enabled] property.
  final bool enabled;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// If unset, defaults to the brightness of [ThemeData.brightness].
  final Brightness? keyboardAppearance;

  /// Initial Value for the field.
  /// This property can be used to pre-fill the field.
  final String? initialValue;
  final double? height;

  /// 2 Letter ISO Code
  final Country2? initialCountry;
  final String? initialCountryCode;
  final String? initialDialCode;

  /// List of 2 Letter ISO Codes of countries to show. Defaults to showing the inbuilt list of all countries.
  final List<String>? countries;



  /// Disable view Min/Max Length check
  final bool disableLengthCheck;

  /// Won't work if [enabled] is set to `false`.
  final bool showDropdownIcon;

  /// Won't work if [enabled] is set to `false`.
  final bool showCountryCode;

  final BoxDecoration dropdownDecoration;

  /// The style use for the country dial code.
  final TextStyle? dropdownTextStyle;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? formatter;

  /// The text that describes the search input field.
  ///
  /// When the input field is empty and unfocused, the label is displayed on top of the input field (i.e., at the same location on the screen where text may be entered in the input field).
  /// When the input field receives focus (or if the field is non-empty), the label moves above (i.e., vertically adjacent to) the input field.
  final String searchText;

  /// Position of an icon [leading, trailing]
  final IconPosition dropdownIconPosition;

  /// Icon of the drop down button.
  ///
  /// Default is [Icon(Icons.arrow_drop_down)]
  final Icon dropdownIcon;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool autofocus;

  /// Autovalidate mode for text form field.
  ///
  /// If [true], it will auto-validate even without user interaction.
  /// If [false], auto-validation will be disabled.
  ///
  final bool autoValidate;

  /// Whether to show or hide country flag.
  ///
  /// Default value is `true`.
  final bool showCountryFlag;

  /// Message to be displayed on autoValidate error
  ///
  /// Default value is `Invalid Mobile Number`.
   String? invalidNumberMessage;
  final EdgeInsetsGeometry? flagButtonMargin;

  /// The padding of the Flags Button.
  ///
  /// The amount of insets that are applied to the Flags Button.
  ///
  /// If unset, defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry flagsButtonPadding;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;
  final Widget? prefixWidget;
  /// Optional set of styles to allow for customizing the country search
  /// & pick dialog
  final PickerDialogStyle? pickerDialogStyle;

  /// The margin of the country selector button.
  ///
  /// The amount of space to surround the country selector button.
  ///
  /// If unset, defaults to [EdgeInsets.zero].
  final EdgeInsets flagsButtonMargin;

   CustomTextFieldPhoneCode({
    Key? key,
    this.suffixText,
    this.hint,
    this.height,
    this.defaultValue,
    this.label,
    this.flagButtonMargin,


    this.autoValidate = false,
    this.readOnly = false,
    this.noBorder = false,
    this.isRequired = true,
    this.autofocus = false,
    this.enable = true,
    this.lines,
    this.maxLength,
    this.prefixWidget,
    this.fontSize,
    this.radius,
    this.contentPaddingH,
    this.formatter,
    this.icon,
    this.suffixData,
    this.iconData,
    this.suffixIconData,
    this.background,
    this.onTap,
    this.onChange,
    this.validateFunc,
    this.onSubmit,
    this.controller,
    this.textInputAction,







    this.initialCountryCode='SA',
    this.initialDialCode='966',
    this.initialCountry,
    this.obscureText = false,
    this.isCountryEditable = true,
    this.textAlign = TextAlign.left,
    this.initialValue,
    this.keyboardType = TextInputType.phone,
    // this.focusNode,
    // this.decoration = const InputDecoration(),
    this.dropdownTextStyle,
    this.onSubmitted,
    this.validator,
    this.onChanged,
    this.countries,
    this.onCountryChanged,
    this.onUpdate,
    this.onSaved,
    this.showDropdownIcon = false,
    this.showCountryCode = true,
    this.dropdownDecoration = const BoxDecoration(),
    this.enabled = true,
    this.keyboardAppearance,
    @Deprecated('Use searchFieldInputDecoration of PickerDialogStyle instead')
    this.searchText = 'Search country',
    this.dropdownIconPosition = IconPosition.trailing,
    this.dropdownIcon = const Icon(Icons.arrow_drop_down),
    this.showCountryFlag = true,
    // this.cursorColor,
    this.disableLengthCheck = false,
    this.flagsButtonPadding = EdgeInsets.zero,
    this.invalidNumberMessage = 'Enter a valid Mobile',
    // this.cursorHeight,
    // this.cursorRadius = Radius.zero,
    // this.cursorWidth = 2.0,
    // this.showCursor = true,
    this.pickerDialogStyle,
    this.flagsButtonMargin = EdgeInsets.zero
  }) : super(key: key){
     invalidNumberMessage=getLangLocalization('Enter a valid Mobile');
   }

  @override
  _CustomTextFieldPhoneCodeState createState() => _CustomTextFieldPhoneCodeState();
}

class _CustomTextFieldPhoneCodeState extends State<CustomTextFieldPhoneCode> {
  late List<Country2> _countryList;
  late Country2 _selectedCountry;
  late List<Country2> filteredCountries;
  late String number;

  String? validatorMessage;

  @override
  void initState() {
    super.initState();

    widget.controller?.text = widget.defaultValue??'';

    _countryList = widget.countries == null
        ? countries
        : countries
        .where((country) => widget.countries!.contains(country.code))
        .toList();
    filteredCountries = _countryList;
    number = widget.initialValue ?? '';
    if(widget.initialCountry!=null){
      _selectedCountry = widget.initialCountry!;
    }else if (widget.initialCountryCode == null && number.startsWith('+')) {
      number = number.substring(1);
      // parse initial value
      // _selectedCountry = countries.firstWhere((country) => number.startsWith(country.dialCode), orElse: () => _countryList.first);
      _selectedCountry = _countryList.firstWhere((item) => item.dialCode == (widget.initialDialCode ?? '971'), orElse: () => _countryList[0]);

      number = number.substring(_selectedCountry.dialCode.length);
    } else {
      _selectedCountry = _countryList.firstWhere((item) => item.code == (widget.initialCountryCode ?? 'US'), orElse: () => _countryList[0]);
    }

    if (widget.autoValidate) {
      final initialPhoneNumber = PhoneNumber(
        countryISOCode: _selectedCountry.code,
        countryCode: '+${_selectedCountry.dialCode}',
        number: widget.initialValue ?? '',
      );

      final value = widget.validator?.call(initialPhoneNumber);

      if (value is String) {
        validatorMessage = value;
      } else {
        (value as Future).then((msg) {
          validatorMessage = msg;
        });
      }
    }
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await ModalSheet.showModalSheet(
        context: context,screen: StatefulBuilder(
      builder: (ctx, setState) => CountryPickerDialog(
        style: widget.pickerDialogStyle,
        filteredCountries: filteredCountries,
        searchText: widget.searchText,
        countryList: _countryList,
        selectedCountry: _selectedCountry,
        onCountryChanged: (Country2 country) {
          _selectedCountry = country;
          widget.onCountryChanged?.call(country);
          setState(() {});
        },
      ),
    ));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        if(widget.label!=null)...[
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: widget.label!, style: Theme.of(context).inputDecorationTheme.labelStyle!),
                      TextSpan(text:  widget.isRequired?null:' Optional', style:  TextStyles.font16SimBold.copyWith(color: Colors.grey,fontSize: 12)),
                    ],
                  ),
                ),
              ),

            ],
          ),
          8.height
        ],


        SizedBox(

         // height: widget.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 42.h,
              //   decoration: const BoxDecoration().listStyle().customColor(Theme.of(context).highlightColor),
              //   padding: EdgeInsets.symmetric(horizontal: kFormPaddingAllSmall.w,vertical: kFormPaddingAllLarge.h),
              //   child: _buildFlagsButton()
              // ),
              // HorizontalSpace(kFormPaddingAllSmall.w),
              _buildFlagsButton(),
              8.width,
              Expanded(
                child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: CustomTextField(
                    borderColor: Colors.transparent,
                    background: widget.background??Color(0xffF7F7F8),
                    prefixIcon: widget.iconData ,
                    // startWidget:SizedBox(height: 18.r,width: 18.r,child: Center(child:CustomSVGIcon(Assets.fieldIconPhoneIcon,color: Theme.of(context).primaryColor)  )),

                    hint: widget.hint,
                    onTap: widget.onTap,
                    autoValidate: widget.autoValidate,
                    enable: widget.enable,
                    noBorder: widget.noBorder,
                    isRequired: widget.isRequired,
                    // label: widget.label,


                    contentPaddingH: widget.contentPaddingH,
                    lines: widget.lines,
                    fontSize: widget.fontSize,
                    radius: widget.radius,
                    suffixIconData: widget.suffixIconData,

                    suffixText: widget.suffixText,
                    controller: widget.controller,
                    suffixData: widget.suffixData,
                    onSubmit: widget.onSubmit,
                    readOnly: widget.readOnly,
                    autofocus: widget.autofocus,
                    icon: widget.icon,
                    textInputAction: widget.textInputAction,

                    // suffixData: _buildFlagsButton(),
                    // prefixWidget: _buildFlagsButton(),
                    prefixWidget: widget.prefixWidget!=null?widget.prefixWidget:
                    (widget.onUpdate==null)?null:Container(
                      width: 70.w,
                      margin: EdgeInsets.all(8.w),
                      alignment: Alignment.centerRight,
                      child: InkWell(onTap: widget.onUpdate!, child: Icon(Icons.edit,color: Theme.of(context).primaryColor)),
                      // child: CustomTapEffect(onTap: widget.onUpdate!, child: Text(tr(LocaleKeys.change), style: const TextStyle().regularStyle(fontSize: 13).activeColor())),
                    ),
                    // suffixMaxWidth: 130,
                    defaultValue: (widget.controller == null) ? widget.defaultValue : widget.controller?.text,
                    obscureText: widget.obscureText,
                    textAlign: widget.textAlign,

                    onSaved: (value) {
                      widget.onSaved?.call(
                        PhoneNumber(
                          countryISOCode: _selectedCountry.code,
                          countryCode: '+${_selectedCountry.dialCode}',
                          number: value,
                        ),
                      );
                    },
                    onChange:widget.onChange?? (value) async {
                      final phoneNumber = PhoneNumber(
                        countryISOCode: _selectedCountry.code,
                        countryCode: '+${_selectedCountry.dialCode}',
                        number: value,
                      );

                      if (widget.autoValidate) {
                        validatorMessage = await widget.validator?.call(phoneNumber);
                      }

                      widget.onChanged?.call(phoneNumber);
                    },
                    validateFunc: (value) {
                      if((value??'').toString().isEmpty){
                        return 'Enter a valid Mobile';
                      }else
                      if (widget.validateFunc != null) return widget.validateFunc!(value);

                      if (!widget.disableLengthCheck && value != null) {
                        return value.length >= _selectedCountry.minLength && value.length <= _selectedCountry.maxLength ? null : 'Enter a valid Mobile';
                      }

                      return validatorMessage;
                    },
                    maxLength: widget.disableLengthCheck ? null : _selectedCountry.maxLength,
                    type: widget.keyboardType,
                    formatter: widget.formatter?? [FilteringTextInputFormatter.digitsOnly],

                  ),
                ),
              ),
              // if( widget.onUpdate!=null)...[
              //   HorizontalSpace(kFormPaddingAllLarge.w),
              //   Container(
              //     margin: EdgeInsets.symmetric(vertical: 16.h),
              //
              //     child: CustomButton(
              //         onTap: widget.onUpdate!,
              //         width: 70.w,
              //         height: 36.h,
              //         color: Theme.of(context).cardColor,
              //         child: Text( tr(LocaleKeys.change),style: const TextStyle().regularStyle()),
              //         // child: Text( tr(LocaleKeys.change),style: const TextStyle().regularStyle()),
              //     ),
              //   ),
              // ]


            ],
          ),
        ),
      ],
    );
  }

  Container _buildFlagsButton() {
    return Container(
      decoration:  BoxDecoration(

          color:Color(0xffF7F7F8),
          // Colors.white,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.2),
          //     blurRadius: 1
          //   )
          // ]
      ),
      height: widget.height,
      padding: EdgeInsets.symmetric(vertical: 13.h),
      margin: widget.flagButtonMargin??0.paddingHorizontal,
      child: DecoratedBox(
        decoration: widget.dropdownDecoration,
        child: InkWell(
          borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
          onTap: widget.enabled ? _changeCountry : null,
          child: Padding(
            padding: widget.flagsButtonPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (widget.enabled && widget.showDropdownIcon && widget.dropdownIconPosition == IconPosition.leading) ...[
                  widget.dropdownIcon,
                  const SizedBox(width: 4),
                ]else...[
                  const SizedBox(width: 12),

                ],
                if (widget.showCountryFlag) ...[
                  Image.asset('assets/images/flags/${_selectedCountry.code.toLowerCase()}.png', height: 20, width: 24),
                  const SizedBox(width: 8),
                ],
                if(widget.showCountryCode)
                  FittedBox(child:
                  BlackRegularText(label: '+${_selectedCountry.dialCode}')
                  ),                if (widget.enabled && widget.showDropdownIcon && widget.dropdownIconPosition == IconPosition.trailing) ...[
                  const SizedBox(width: 4),
                  widget.dropdownIcon,
                ],
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum IconPosition {
  leading,
  trailing,
}
