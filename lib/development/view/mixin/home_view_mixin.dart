import 'package:flutter/material.dart';
import 'package:flutter_use_case/development/view/home_view.dart';
import 'package:flutter_use_case/product/service/manager/login_service.dart';
import 'package:flutter_use_case/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_use_case/product/state/container/product_state_items.dart';

mixin HomeViewMixin on State<HomeView>{

  late final LoginService loginService;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  @override
  void initState() {
    super.initState();
    loginService = LoginService(ProductStateItems.productNetworkManager);
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError
    );
  }
}