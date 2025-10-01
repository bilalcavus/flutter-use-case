

import 'dart:io';

import 'package:flutter/material.dart';

//manage network error with screen
final class ProductNetworkErrorManager {
  final BuildContext context;
  ProductNetworkErrorManager(this.context);

  void handleError(int value){
    if (value == HttpStatus.unauthorized) {
      
    }
  }
}