import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_use_case/development/viewmodel/state/home_state.dart';
import 'package:flutter_use_case/product/service/interface/authentication_operation.dart';

class HomeViewModel extends Cubit<HomeState> {
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