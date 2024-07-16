import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:taknikat/model/reject_model/reject_model.dart';

part 'serializer.g.dart';

@SerializersFor(const [
  RejectModel,
])
final Serializers serializers = (_$serializers.toBuilder()
  ..addPlugin(StandardJsonPlugin()))
    .build();