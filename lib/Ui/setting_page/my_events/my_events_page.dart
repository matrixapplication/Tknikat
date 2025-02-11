import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_events/add_event_screen.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/event_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../app/slide_animation.dart';
import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../injectoin.dart';
import '../../../model/event_model/event_model.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'bloc/my_events_bloc.dart';
import 'bloc/my_events_event.dart';
import 'bloc/my_events_state.dart';

class MyEventsPage extends StatefulWidget {
  @override
  _MyEventsPageState createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
   final _bloc= sl<MyEventsBloc>();
  @override
  void initState() {

    // sl<MyEventsBloc>().add(GetMyEvents((b) => b..page = 1));
    _listController.addListener(() {
      if (_listController.position.atEdge) {

        if (_listController.position.pixels ==
            _listController.position.maxScrollExtent) {
          if(_bloc.pagingController.nextPageKey!=null)
          _bloc.add(GetMyEvents((b) => b..page =_bloc.pagingController.nextPageKey));
        }
      }
    });
    super.initState();
  }

  final ScrollController _listController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: AddEventScreen(),
            ),
          );
        },
        backgroundColor: primaryColor,
        shape: CircleBorder(),
        mini: false,
        child:Icon(Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body:BlocConsumer<MyEventsBloc, MyEventsState>(
        listener: (context, state) {
          if (state.isLoading) {
          }
        },
        bloc: sl<MyEventsBloc>(),
        builder: (context, state) {
          final bloc = sl<MyEventsBloc>();

          return Stack(
            children: [
              SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
             Column(
               children: [
                 40.height,
                 AuthHeaderWidget(title: AppLocalizations.of(context).translate("Events"),hasLogo: false),
                 20.height,
                 RefreshIndicator(
                     color: primaryColor,
                     onRefresh: () async {
                       bloc.add(GetMyEvents((b) => b..page = 1));
                     },
                     child:
                     GridView.count(
                         controller: _listController,
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         shrinkWrap: true,
                         physics: ClampingScrollPhysics(),
                         crossAxisCount: 2,
                         // childAspectRatio: 0.630,
                         crossAxisSpacing: 10.0,
                         mainAxisSpacing: 10.0,
                         children: List.generate(
                             state.myEvents.length, (index) {
                           return EventItem(
                             state.myEvents[index],
                             isMine: true,
                           );
                         }))
                   // PagedListView.separated(
                   //   separatorBuilder: (context, index) => SizedBox(height: 16),
                   //   pagingController: bloc.pagingController!,
                   //   builderDelegate: PagedChildBuilderDelegate<EventModel>(
                   //     noItemsFoundIndicatorBuilder: (context) => Center(
                   //       child: Text(
                   //         AppLocalizations.of(context).translate("no events"),
                   //       ),
                   //     ),
                   //     itemBuilder: (context, item, index) {
                   //       return SlidStaggeredListAnimation(
                   //         index: index,
                   //         child:
                   //        Container(
                   //          height: 100,
                   //          width: 100,
                   //          child:  EventItem(
                   //            item,
                   //            isMine: true,
                   //          ),
                   //        )
                   //       );
                   //     },
                   //   ),
                   // ),
                 ),
                 if (state.isLoading)
                   Center(child: loader(context: context)),
                 if (state.myEvents.isEmpty && !state.isLoading)
                   Center(
                     child: Container(
                       width: double.infinity,
                       height: double.infinity,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           SvgPicture.asset("assets/images/empty_content.svg"),
                           SizedBox(height: 20),
                           Text(
                             AppLocalizations.of(context).translate("not_found_event"),
                             style: TextStyle(),
                           ),
                         ],
                       ),
                     ),
                   ),
               ],
             )
            ],
          );
        },
      ),
    );
  }

   @override
   void dispose() {
     _listController.dispose();
     super.dispose();
   }
}
