import 'package:flutter_use_case/development/viewmodel/state/home_state.dart';
import 'package:flutter_use_case/product/service/interface/authentication_operation.dart';
import 'package:flutter_use_case/product/state/base/base_cubit.dart';

class HomeViewModel extends BaseCubit<HomeState> {
  final AuthenticationOperation _authenticationOperationService;

  HomeViewModel({required AuthenticationOperation operationService})
    : _authenticationOperationService = operationService,
      super(const HomeState(isLoading: false));

  void changeLoading(){
    emit(state.copyWith(isLoading: !state.isLoading));
  }
  
  Future<void> fetchUsers() async {
    final response = await _authenticationOperationService.users();
    emit(state.copyWith(users: response));
  }
}