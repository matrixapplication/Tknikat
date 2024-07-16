import 'package:bloc/bloc.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_event.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  Repository _repository;

  VendorBloc(this._repository) : super(VendorState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetVendorData>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..vendor.replace(event.vendor)
          ..success = false));

        final vendorsData =
            await _repository.getVendorDetails(event.vendor.id!);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..products.replace(vendorsData.vendorProducts!)
          ..projects.replace(vendorsData.vendorProjects!)
          ..services.replace(vendorsData.vendorServices!)
          ..shares.replace(vendorsData.vendorShares!)));
      } on NetworkException catch (e) {
        print('Error: ${e.toString()}\n');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = false));
      }
    });
    on<GetVendorEvents>((event, emit) async {
      try {
        emit(state.rebuild((b) => b..isLoading = true));

        final res = await _repository.getVendorEvents(1, event.id);
        emit(state.rebuild((b) => b
          ..initialized = true
          ..isLoading = false
          ..events.replace(res)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..initialized = true
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }

  Future<bool> getBlockingSettings() async {
    return _repository.getBlockingSettings();
  }
}
