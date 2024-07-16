import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/filter_screen/bloc/filter_event.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/category_model/category_model.dart';
import 'package:taknikat/model/country/country_model.dart';

import 'bloc/filter_bloc.dart';
import 'bloc/filter_state.dart';

class FilterScreen extends StatefulWidget {
  final CustomFilter filter;
  final bool showCategoryFilter;

  FilterScreen(this.filter, {this.showCategoryFilter = true});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  CustomFilter customFilter = new CustomFilter();
  String? selectedColor;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetFilterByCategory());
    customFilter = widget.filter.copyWith();
  }

  int isNew = 0;

  var _bloc = sl<FilterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: baseText(
              AppLocalizations.of(context).translate("filter results"),
              color: Colors.white,
              textAlign: TextAlign.center),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: primaryColor,
                  height: sizeAware.height * 0.023696682464455,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BlocBuilder(
                          bloc: _bloc,
                          builder: (BuildContext context, FilterState state) {
                            var state = _bloc.state;
                            if (state.isLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state.error != null) {
                              return Center(
                                  child: baseText(state.error!,
                                      color: Colors.red,
                                      textAlign: TextAlign.center));
                            }
                            return ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      if (widget.showCategoryFilter)
                                        Row(
                                          children: [
                                            Expanded(
                                              child: DropdownButtonFormField<
                                                  CategoryModel>(
                                                items: state.categories
                                                    .map(
                                                      (e) => DropdownMenuItem<
                                                          CategoryModel>(
                                                        child: Text(e.name!),
                                                        value: e,
                                                      ),
                                                    )
                                                    .toList(),
                                                value: customFilter.category,
                                                onChanged: (value) {
                                                  customFilter =
                                                      customFilter.copyWith(
                                                          category:
                                                              Wrapped.value(
                                                                  value));
                                                  setState(() {});
                                                },
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                      Icons.category_outlined),
                                                  hintText: AppLocalizations.of(
                                                          context)
                                                      .translate(
                                                    'filter by category'),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.clear),
                                                onPressed: () {
                                                  customFilter =
                                                      customFilter.copyWith(
                                                          category:
                                                              Wrapped.value(
                                                                  null));
                                                  setState(() {});
                                                }),
                                          ],
                                        ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButtonFormField<
                                                Country>(
                                              items: state.countries
                                                  .map(
                                                    (e) => DropdownMenuItem<
                                                        Country>(
                                                      child: Text(e.name!),
                                                      value: e,
                                                    ),
                                                  )
                                                  .toList(),
                                              value: customFilter.country,
                                              onChanged: (value) {
                                                customFilter =
                                                    customFilter.copyWith(
                                                        country: Wrapped.value(
                                                            value!));
                                                setState(() {});
                                              },
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                    Icons.location_on_outlined),
                                                hintText: AppLocalizations.of(
                                                        context)
                                                    .translate(
                                                        'filter by country'),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.clear),
                                              onPressed: () {
                                                customFilter =
                                                    customFilter.copyWith(
                                                        country: Wrapped.value(
                                                            null));
                                                setState(() {});
                                              }),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child:
                                                DropdownButtonFormField<Gender>(
                                              items: Gender.values
                                                  .map(
                                                    (e) => DropdownMenuItem<
                                                        Gender>(
                                                      child: Text(
                                                          e.name),
                                                      value: e,
                                                    ),
                                                  )
                                                  .toList(),
                                              value: customFilter.gender,
                                              onChanged: (value) {
                                                customFilter =
                                                    customFilter.copyWith(
                                                        gender: Wrapped.value(
                                                            value!));
                                                setState(() {});
                                              },
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(Icons
                                                    .supervised_user_circle_outlined),
                                                hintText:
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            'filter by gender'),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.clear),
                                              onPressed: () {
                                                customFilter =
                                                    customFilter.copyWith(
                                                        gender: Wrapped.value(
                                                            null));
                                                setState(() {});
                                              }),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      TextButton.icon(
                                        label: Text(
                                          AppLocalizations.of(context)
                                              .translate('clear all'),
                                        ),
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          customFilter = CustomFilter();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pop(customFilter);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                              child: Text(
                                            AppLocalizations.of(context)
                                                .translate('apply filter'),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
