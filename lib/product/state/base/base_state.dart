import 'package:flutter/material.dart';
import 'package:flutter_use_case/product/service/manager/product_service_manager.dart';
import 'package:flutter_use_case/product/state/container/product_state_items.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {

  ProductNetworkManager get productNetworkManager => 
    ProductStateItems.productNetworkManager;
}