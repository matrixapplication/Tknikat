import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taknikat/Ui/all_events_page/bloc/events_bloc.dart';
import 'package:taknikat/app/slide_animation.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/event_item.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/filters/event_filter.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import '../../core/assets_image/app_images.dart';
import '../../core/custom_text_field.dart';
import '../../injectoin.dart';
import '../auth_screen/page/otp/widgets/auth_header_widget.dart';

class AllEventPage extends StatelessWidget {
  const AllEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Stack(
        children: [
          SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
          BlocProvider.value(
            value: sl<EventsBloc>(),
            child: Builder(
              builder: (context) {
                final bloc = context.read<EventsBloc>();
                bloc.add(ReloadEvents());
                return
                  Column(
                    children: [
                      40.height,
                      AuthHeaderWidget(title: AppLocalizations.of(context).translate("Events"),hasFilter: true,
                        onTapFilter: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BlocProvider.value(
                                    value: bloc, child: FilterEventsDialog());
                              });
                        },
                      ),
                      Container(
                        padding: 20.paddingHorizontal,
                        child:  CustomTextField(
                          borderColor: Colors.transparent,
                          hintText: AppLocalizations.of(context).translate('search'),
                          onChanged: (value){
                                    bloc.add(FilterChanged(bloc.state.filter.copyWith(
                                      searchText: value.trim(),
                                    )));
                          },
                          prefixIcon: SvgPicture.asset(AppImages.search),
                          controller: TextEditingController(),
                        ),
                      ),
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
        ],
      )
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
