library service_content_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/comment_model.dart';

part 'service_content_state.g.dart';

abstract class ServiceContentState
    implements Built<ServiceContentState, ServiceContentStateBuilder> {
  String? get error;
  bool get success;

  bool get isLoading;

  BuiltList<CommentModel> get comments;

  Paginator get paginator;

  ServiceContentState._();

  factory ServiceContentState([updates(ServiceContentStateBuilder b)]) =
      _$ServiceContentState;

  factory ServiceContentState.initail() {
    return ServiceContentState((b) => b
      ..error = ""
      // ..favorite.replace([])
      ..success = false
      ..isLoading = false);
  }
}
