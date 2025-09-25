import 'package:flutter/material.dart';
import 'package:flutter_use_case/product/widget/button/normal_button.dart';
import 'package:flutter_use_case/product/widget/dialog/success_dialog.dart';

class DialogNormalButton extends StatelessWidget {
  const DialogNormalButton({super.key, required this.onComplete});
  final ValueChanged<bool> onComplete;

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      title: 'Dialog normal button',
      onTap: () async {
        final response = await SuccessDialog.show(title: 'title', context: context);
        onComplete.call(response);
      },
    );
  }
}