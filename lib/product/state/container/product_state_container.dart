import 'package:flutter_use_case/product/service/manager/product_service_manager.dart';
import 'package:flutter_use_case/product/state/view_model/product_view_model.dart';
import 'package:get_it/get_it.dart';

final class ProductStateContainer {

  const ProductStateContainer._();
  static final _getIt = GetIt.I;
  static void  setup() {

    _getIt.registerSingleton<ProductNetworkManager>(
      ProductNetworkManager.base()
    );

    _getIt.registerLazySingleton<ProductViewModel>(
      ProductViewModel.new,
    );
    
  }

   static T read<T extends Object>() => _getIt<T>();
}