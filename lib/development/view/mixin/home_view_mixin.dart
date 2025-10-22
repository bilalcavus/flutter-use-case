import 'package:flutter_use_case/development/view/home_view.dart';
import 'package:flutter_use_case/development/viewmodel/home_view_model.dart';
import 'package:flutter_use_case/product/service/manager/login_service.dart';
import 'package:flutter_use_case/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_use_case/product/state/base/base_state.dart';
import 'package:flutter_use_case/product/state/container/product_state_items.dart';

mixin HomeViewMixin on BaseState<HomeView>{

  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError
    );
    _homeViewModel = HomeViewModel(
    operationService: LoginService(productNetworkManager),
  );
}

  
}