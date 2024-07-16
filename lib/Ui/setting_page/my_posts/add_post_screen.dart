import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/add_post_widget.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen();

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen>
    with AutomaticKeepAliveClientMixin<AddPostScreen> {
  final CreatePostBloc _bloc = sl<CreatePostBloc>();
  late final ScrollController _scrollController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer<CreatePostBloc, CreatePostState>(
        listener: (context, state) {
          if (state.isSuccess) {
            sl<PostsBloc>().add(InitMyPosts());

            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                  context: context,
                  btnOkText: AppLocalizations.of(context).translate("Ok"),
                  btnOkColor: primaryColor,
                  dialogType: DialogType.success,
                  title:
                  AppLocalizations.of(context)
                      .translate("add_post"),
                  desc:
                  AppLocalizations.of(context)
                      .translate("add_post_done"),
                  btnOkOnPress: () {},
                  onDismissCallback: (type) {
                    Navigator.pop(context, true);
                  })
                ..show();
            });
          }
          if (state.error.isNotEmpty) showToast(state.error);
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: baseText(
                  AppLocalizations.of(context)
                      .translate("add_post"), color: Colors.white),
              elevation: 0,
              centerTitle: true,
              leading: BackButton(color: Colors.white),
            ),
            body: Stack(
              children: [
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          color: primaryColor,
                          child: Column(
                            children: [
                              Container(height: 20),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.all(8.0),
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            separatorBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Divider(thickness: 2),
                                ),
                            itemCount:
                                state.posts.length < 1 ? 1 : state.posts.length,
                            itemBuilder: (context, index) => AddPostWidget(
                                  postIndex: index,
                                )),
                      ),
                      SizedBox(
                        height: 120.0,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (context.watch<CreatePostBloc>().state.posts.length <
                            5)
                          OutlinedButton(
                            onPressed: () {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              _bloc.add(AddSubPost(PostModel()));
                            },
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate("attach_subPost"),
                                style:
                                  TextStyle(fontSize: 16, color: primaryColor),
                            ),
                          ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) return;

                              if (context
                                  .read<CreatePostBloc>()
                                  .state
                                  .posts
                                  .any((element) =>
                                      element.addedImages?.isEmpty ?? true)) {
                                showToast(
                                    AppLocalizations.of(context)
                                    .translate("post_must_one_photo"));
                                return;
                              }
                              _bloc.add(SubmitPost());
                            },
                            child: Text( AppLocalizations.of(context)
                                .translate("add_post"))),
                      ],
                    ),
                  ),
                ),
                if (state.isLoading)
                  Center(
                    child: loader(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
