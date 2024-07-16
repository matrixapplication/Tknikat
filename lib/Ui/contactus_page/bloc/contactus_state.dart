library contactus_state;

import 'package:built_value/built_value.dart';

part 'contactus_state.g.dart';

abstract class ContactUsState
    implements Built<ContactUsState, ContactUsStateBuilder> {
  // fields go here

  String? get error;

  bool get isLoading;

  ContactUsState._();

  factory ContactUsState([updates(ContactUsStateBuilder b)]) = _$ContactUsState;

  factory ContactUsState.init() {
    return ContactUsState((b) => b
      ..error = ""
      ..isLoading = false);
  }
}
