

import 'package:flutter/material.dart';
import 'package:ycflutter/res/YcColors.dart';

class ItemLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var divider = new Divider(height: 1.0,indent: 1.0, color: YcColors.colorLine);
    return divider;
  }
}

