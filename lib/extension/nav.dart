import 'package:flutter/material.dart';

extension Nav on BuildContext {
  push(Widget nextScreen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) {
      return nextScreen;
    }));
  }
}
