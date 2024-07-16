import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import '../../../app/App.dart';
import 'contactus_event.dart';
import 'contactus_state.dart';

class ContactusBloc extends Bloc<ContactusEvent, ContactUsState> {
  Repository _repository;

  ContactusBloc(this._repository) : super(ContactUsState.init()) {
    on<Clear>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<ContactUs>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""));
        final data = await _repository.contactUs(
          event.name,
          event.mail,
          event.title,
          event.message,
        );
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = "Send Message Successfull"));
        Navigator.of(navKey.currentContext!).pop();

      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }
}
