import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vexana/vexana.dart';

class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base() : super(options: BaseOptions(
    baseUrl: dotenv.env['BASE_URL'] ?? 'https://fakestoreapi.com',
  ));


  /// Error handler
  void listenErrorState({required ValueChanged<int> onErrorStatus}){
    interceptors.add(InterceptorsWrapper(
      onError: (e, handler){
        onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
        return handler.next(e);
      }
    ));
  }
    
}