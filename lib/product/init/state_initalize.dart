import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_use_case/product/state/container/product_state_items.dart';
import 'package:flutter_use_case/product/state/view_model/product_view_model.dart';

final class StateInitalize extends StatelessWidget {
  const StateInitalize({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(value: ProductStateItems.productViewModel)
      ],
      child: child,
    );
  }
}