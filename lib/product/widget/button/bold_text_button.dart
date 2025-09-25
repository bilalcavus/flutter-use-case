

import 'package:flutter/material.dart';

final class BoldTextButton extends TextButton {
  BoldTextButton({super.key, required super.onPressed, required super.child
  }) : super(style: TextButton.styleFrom(
    elevation: 20,
  ));
  
}