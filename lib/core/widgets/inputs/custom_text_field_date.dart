import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';

import '../../utils/date/date_converter.dart';
import '../texts/black_texts.dart';
import 'base_form.dart';

class CustomTextFieldDate extends StatefulWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? iconSVG;
  final String? title;

  final DateTime? calendarStartDate;
  final DateTime? calendarEndDate;
  final String? label;
  final bool autoValidate;
  final bool noBorder;
  final bool isRequired;
  final bool autofocus;
  final VoidCallback? onTap;
  final int lines;
  final ValueChanged<String>? onChange;
  final Function? validateFunc;
  final ValueChanged<String>? onSubmit;
  final IconData? iconData;
  final IconData? suffixIconData;
  final Widget? suffixData;
  final double fontSize;
  final double? radius;
  final double contentPaddingH;
  final TextInputType type;
  final List<TextInputFormatter>? formatter;
  final Color? background;
  final Color? borderColor;
  final TextEditingController controller;
  final TextInputAction? textInputAction;

  const CustomTextFieldDate({
    Key? key,
    this.background,
    this.iconData,
    this.title,
    this.iconSVG,
    this.defaultValue,
    this.borderColor,
    this.calendarStartDate,
    this.calendarEndDate,
    // this.error,
    this.hint,
    this.onTap,
    this.autoValidate = false,
    this.noBorder = false,
    this.autofocus = false,
    this.isRequired = true,
    this.label,
    this.contentPaddingH = 16,
    this.lines = 1,
    this.fontSize = 14,
    this.radius,
    this.onChange,
    this.textInputAction,
    this.suffixIconData,
    this.validateFunc,
    this.suffixText,
    this.formatter,
    this.type = TextInputType.text,
    required this.controller,
    this.suffixData,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<CustomTextFieldDate> createState() => _CustomTextFieldDateState();
}

class _CustomTextFieldDateState extends State<CustomTextFieldDate> {
  final tag = 'CustomFieldDate';
  late DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.defaultValue != null
        ? DateConverter.isoStringToLocalDate(widget.defaultValue ?? "")
        : DateTime.now();
    if (widget.defaultValue != null) {
      widget.controller.text = DateConverter.slotDate(_selectedDate!);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.title!=null)
        ...[
        BlackRegularText(label: widget.title??'',fontSize: 16,),
        ],
        InkWell(
          onTap: () {
            _showCalenderDialog(context);
          },
          child: CustomTextField(
             borderColor: widget.borderColor,
            background: widget.background,
            prefixIcon: widget.iconData ?? Icons.calendar_month,
            prefixIconColor: Colors.grey.shade400,
            // prefixWidget:widget.iconSVG==null?null: SizedBox(height: 20.r,width: 20.r,child: Center(child:SVGIcon(widget.iconSVG!,color: Colors.black,)  )),

            defaultValue: widget.defaultValue,
            hint: widget.hint,
            onTap: widget.onTap ??
                () {
                  _showCalenderDialog(context);
                },
            autoValidate: widget.autoValidate,
            // enable: false,
            readOnly: true,

            noBorder: widget.noBorder,
            isRequired: widget.isRequired,
            label: widget.label,
            contentPaddingH: widget.contentPaddingH,
            lines: widget.lines,
            fontSize: widget.fontSize,
            radius: widget.radius,
            onChange: widget.onChange,
            suffixIconData: widget.suffixIconData,
            validateFunc: (value) {
              if ((value == null || value.isEmpty) && widget.isRequired) {
                return getLangLocalization('this_field_required');
              }

              if (widget.validateFunc != null)
                return widget.validateFunc!(value);
              return null;
            },
            suffixText: widget.suffixText,
            formatter: widget.formatter,
            // type: widget.TextInputType.number,
            controller: widget.controller,
            suffixData: widget.suffixData,
            onSubmit: widget.onSubmit,
            // readOnly: widget.readOnly,
            autofocus: widget.autofocus,
            // maxLength: widget.maxLength,
            // icon: widget.icon,
            textInputAction: widget.textInputAction,
          ),
        )
      ],
    );
  }

  Future<void> _showCalenderDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor, // header background color
                onPrimary: Colors.black, // header text color
                onSurface: Colors.black, // body text color
              ),
            ),
            child: child!,
          );
        },
        initialDate: (_selectedDate ?? DateTime.now()),
        firstDate: widget.calendarStartDate ?? DateTime(2015, 8),
        lastDate: widget.calendarEndDate ?? DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text =
            DateConverter.slotDate(_selectedDate ?? DateTime.now());
      });
    }
  }
}
