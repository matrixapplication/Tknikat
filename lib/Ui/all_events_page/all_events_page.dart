import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taknikat/Ui/all_events_page/bloc/events_bloc.dart';
import 'package:taknikat/app/slide_animation.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/event_item.dart';
import 'package:taknikat/core/filters/event_filter.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/model/event_model/event_model.dart';

import '../../injectoin.dart';

class AllEventPage extends StatelessWidget {
  const AllEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSc = Theme.of(context).colorScheme;
    final primaryColor = colorSc.primary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorSc.primary,
        title: Container(
          margin: EdgeInsets.all(13),
          width: sizeAware.width * 0.282051282051282,
          child: SvgPicture.asset(
            "assets/images/logo-white.svg",
            color: Colors.white,
            height: sizeAware.height * 0.050090047393365,
          ),
        ),
        centerTitle: true,
        titleSpacing: 4,
        elevation: 0,
      ),
      body: BlocProvider.value(
        value: sl<EventsBloc>(),
        child: Builder(
          builder: (context) {
            final bloc = context.read<EventsBloc>();
            bloc.add(ReloadEvents());
            return Column(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 16,
                    ),
                    color: primaryColor,
                    child: TextFormField(
                      onChanged: (value) {
                        bloc.add(FilterChanged(bloc.state.filter.copyWith(
                          searchText: value.trim(),
                        )));
                      },
                      decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context).translate('search'),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(children: [
                    Container(
                        alignment: AlignmentDirectional.topStart,
                        child: MainTitle(
                          AppLocalizations.of(context).translate("All Events"),
                          height: 30,
                        )),
                    Spacer(),
                    TextButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BlocProvider.value(
                                    value: bloc, child: FilterEventsDialog());
                              });
                        },
                        icon: Icon(Icons.sort),
                        label: Text(
                            AppLocalizations.of(context).translate("Sort")))
                  ]),
                ),
                SizedBox(height: sizeAware.height * 0.01),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.pagingController.refresh();
                    },
                    child: PagedGridView(
                      padding: EdgeInsets.all(24),
                      pagingController: bloc.pagingController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                      ),
                      builderDelegate: PagedChildBuilderDelegate<EventModel>(
                        itemBuilder: (context, item, index) =>
                            SlidStaggeredGridAnimation(
                          index: index,
                          child: EventItem(
                            item,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FilterEventsDialog extends StatelessWidget {
  const FilterEventsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<EventsBloc>();
    final filter = bloc.state.filter;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context).translate('Sort'),
              style: Theme.of(context).textTheme.headline6,
            ),
            CheckboxListTile(
                value: filter.ordering == EventOrdering.start,
                title:
                    Text(AppLocalizations.of(context).translate('start date')),
                onChanged: (value) {
                  _filter(bloc, filter, EventOrdering.start, context);
                }),
            CheckboxListTile(
                title: Text(AppLocalizations.of(context).translate('end date')),
                value: filter.ordering == EventOrdering.end,
                onChanged: (value) {
                  _filter(bloc, filter, EventOrdering.end, context);
                }),
            CheckboxListTile(
                title: Text(AppLocalizations.of(context).translate('Expired')),
                value: filter.ordering == EventOrdering.expired,
                onChanged: (value) {
                  _filter(bloc, filter, EventOrdering.expired, context);
                }),
          ],
        ),
      ),
    );
  }

  void _filter(EventsBloc bloc, EventsFilter filter, EventOrdering ordering,
      BuildContext context) {
    bloc.add(
      FilterChanged(
        filter.copyWith(ordering: ordering),
      ),
    );
    Navigator.pop(context);
  }
}
