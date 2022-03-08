import 'package:flutter/material.dart';

import '../constants.dart';

  Container sliderDots() {
    return Container(
              margin: EdgeInsets.only(right: 5),
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: appPrimaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
            );
  }