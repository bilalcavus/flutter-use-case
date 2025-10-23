import 'package:flutter/material.dart';
import 'package:flutter_use_case/product/state/base/base_cubit.dart';
import 'package:flutter_use_case/product/state/view_model/product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());

  void changeThemeMode(ThemeMode themeMode){
    emit(state.copyWith(themeMode: themeMode));
  }
  
}