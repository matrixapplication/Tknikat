// Register the serializers
// serializer.dart

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'user.g.dart';

@SerializersFor(const [
  UserModel,
  // Add other models here
])
final Serializers serializers = (_$serializers.toBuilder()
  ..addPlugin(StandardJsonPlugin())
  ..add(CustomUserModelSerializer()))
    .build();
