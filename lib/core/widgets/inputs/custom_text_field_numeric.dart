import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldNumber extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? defaultValue;

  final bool readOnly;
  final bool noBorder;
  final bool isRequired;
  final bool enable;

  final TextEditingController? controller;

  const CustomTextFieldNumber({
    Key? key,
    this.hint,
    this.label,
    this.defaultValue,
    this.readOnly = false,
    this.noBorder = false,
    this.isRequired = true,
    this.enable = true,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = controller ?? TextEditingController();

    // إذا كان هناك قيمة افتراضية، قم بتعيينها
    if (defaultValue != null && _controller.text.isEmpty) {
      _controller.text = defaultValue!;
    }

    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border: noBorder ? InputBorder.none : const OutlineInputBorder(),
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                int currentValue = int.tryParse(_controller.text) ?? 0;
                currentValue++;
                _controller.text = currentValue.toString();
              },
              child: Icon(Icons.arrow_drop_up),
            ),
            InkWell(
              onTap: () {
                int currentValue = int.tryParse(_controller.text) ?? 0;
                if(currentValue > 0){
                  currentValue--;
                  _controller.text = currentValue.toString();
                }else{
                  _controller.text = '';
                }
              },
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
      readOnly: readOnly,
      enabled: enable,
      validator: (value) {
        int? v = int.tryParse(value ?? '');
        if (v == null && isRequired) {
          return "This field is required";
        }
        return null;
      },
    );
  }
}
