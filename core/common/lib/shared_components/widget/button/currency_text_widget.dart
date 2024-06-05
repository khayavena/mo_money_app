import 'package:flutter/material.dart';

import '../../util/amount_helper.dart';

class CurrencyTextWidget extends StatelessWidget {
  final int value;
  final Color color;
  final double fontSize;

  const CurrencyTextWidget(
      {super.key = const Key("currencyTextWidget"),
      required this.value,
      required this.color,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppHelper.moneyFormat(value.toString()),
      style: TextStyle(color: color, letterSpacing: 0.1, fontSize: fontSize),
    );
  }
}
