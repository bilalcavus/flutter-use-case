import 'package:flutter_use_case/product/service/manager/product_service_manager.dart';
import 'package:flutter_use_case/product/state/container/product_state_container.dart';

import '../view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager => 
      ProductStateContainer.read<ProductNetworkManager>();
  
  static ProductViewModel get productViewModel => 
      ProductStateContainer.read<ProductViewModel>();
 
}