import 'package:flutter/material.dart';

final class DialogBase {
  DialogBase._();


  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) async {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: false,
      useSafeArea: false,
    );
  }
}