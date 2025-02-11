import 'package:flutter/material.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import 'custom_loading_spinner.dart';
import 'no_data.dart';


class CustomScreenStateLayout extends StatelessWidget {
  final bool _isEmpty;
  final bool _isLoading;
  final WidgetBuilder? _errorBuilder;
  final WidgetBuilder? _loadingBuilder;
  final VoidCallback? _onRetry;
  final WidgetBuilder _builder ;
  final WidgetBuilder? _noDataBuilder ;

  const CustomScreenStateLayout({Key? key,
    required  WidgetBuilder builder,
    bool isEmpty = false,
    bool isLoading = false,
    WidgetBuilder? errorBuilder,
    WidgetBuilder? loadingBuilder,
    WidgetBuilder? noDataBuilder,
    VoidCallback? onRetry,
  })
      :_isEmpty = isEmpty,_isLoading = isLoading,
        _errorBuilder = errorBuilder,
        _loadingBuilder = loadingBuilder,
        _noDataBuilder = noDataBuilder,
        _builder = builder,
        _onRetry = onRetry, super(key: key);

  @override
  Widget build(BuildContext context) {
    return  _buildView(context);
  }

  Widget _buildView(BuildContext context) {
    if (_isLoading) {
      return _loadingBuilder!=null? _loadingBuilder!(context): Center(child: loader());
    }   else if(_isEmpty){
      return _noDataBuilder!=null? _noDataBuilder!(context): const CustomNoDataView();

    } else{
      return _builder(context);
    }

  }
}
