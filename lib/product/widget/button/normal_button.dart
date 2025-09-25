import 'package:flutter/material.dart';
import 'package:flutter_use_case/product/extension/dynamic_size_extension.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({super.key, required this.onTap, required this.title});

  final String title;
  final VoidCallback onTap;
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: context.dynamicHeight(0.03),
      onTap: onTap,
      child: Text(title),
    );
  }
}