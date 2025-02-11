import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/texts/hint_texts.dart';




class CustomRadio<T> extends StatelessWidget {
  final String? _title;
  final T _value;
  final T? _groupValue;
  final ValueChanged<T> _onChanged;

  const CustomRadio({
    String? title,
    required T value,
    T? groupValue,
    required ValueChanged<T> onChanged,
  })  : _title = title,
        _value = value,
        _groupValue = groupValue,
        _onChanged = onChanged;

  @override
  Widget build(BuildContext context) {
    bool isSelected= _value== _groupValue&&_groupValue!=null;
    return Row(
      children: [
        GestureDetector(
          onTap: () => _onChanged(_value),

          child: Container(
            decoration:  BoxDecoration(borderRadius:
            BorderRadius.circular(50),color: isSelected?Theme.of(context).primaryColorDark:Colors.transparent,border: Border.all(color: isSelected?Colors.transparent:Colors.red)),
            width: 20.r,
            height: 20.r,
            child: Center(child: Icon(Icons.done,color: Theme.of(context).cardColor,size: 14.r,)),

          ),
        ),


        // Radio<T>(
        //   value: _value,
        //   groupValue: _groupValue,
        //   onChanged: (value) => _onChanged(_value),
        // ),
        if(_title!=null)
          Expanded(child:
          HintRegularText(label:_title??'',
            textAlign: TextAlign.start,labelColor: Colors.white,)),

      ],
    );
  }
}
