import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_appp/core/theming/base_colors.dart';

class DarkColors implements BaseColors{
  @override
  Color get backGround => Colors.white;

  @override
  Color get error => Colors.red;

  @override
  Color get primary => Colors.black;

  @override
  Color get serfce => Colors.grey;

  @override
  Color get socendry => Colors.white;
}