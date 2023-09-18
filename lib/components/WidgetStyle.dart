import 'package:flutter/material.dart';

import '../utils/AppConstants.dart';

class BoxShadows {
  BoxDecoration customDecoration(color, spreadRadius, blurRadius, offset) {
    return BoxDecoration(boxShadow: [
      BoxShadow(
          color: color,
          // Shadow color
          spreadRadius: spreadRadius,
          // Spread of the shadow
          blurRadius: blurRadius,
          // Blur radius of the shadow
          offset: offset)
    ]);
  }
  // return
}
