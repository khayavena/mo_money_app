import 'package:flutter/material.dart';
import 'package:mo_money_app/shared_components/widget/button/BigTextWidget.dart';

import '../../../shared_components/util/cusmtom_colors.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key = const Key("homeHeaderWidget")});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
            child: BigTextWidget(text: "Wallet", color: secondaryColorDark)),
        SizedBox(height: 4),
        Expanded(
          child: Text(
            "Active",
            style: TextStyle(
                color: tertiaryColorLight, fontSize: 16, letterSpacing: 0.01),
          ),
        )
      ],
    );
  }
}
