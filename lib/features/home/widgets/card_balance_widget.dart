import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared_components/util/cusmtom_colors.dart';
import '../../../shared_components/widget/button/currency_text_widget.dart';

class CardBalanceWidget extends StatelessWidget {
  final int number;

  const CardBalanceWidget(
      {super.key = const Key("cardBalanceWidget"), required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: Stack(children: <Widget>[
        Center(
          child: SvgPicture.asset(
            "assets/home/card_background.svg",
            height: 140,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 34, top: 13),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Balance",
                    style: TextStyle(
                        color: primaryColor, fontSize: 16, letterSpacing: 0.1),
                  ),
                  CurrencyTextWidget(
                    color: primaryColor,
                    fontSize: 24,
                    value: number,
                  ),
                  // Text(
                  //   number,
                  //   style: const TextStyle(
                  //       color: primaryColor, letterSpacing: 0.1, fontSize: 24),
                  // ),
                ],
              ),
            )),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 34, bottom: 13),
            child: Text(
              "Linked to card",
              style: TextStyle(
                  color: tertiaryColorLight, letterSpacing: 0.1, fontSize: 16),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 42.0),
            child: SvgPicture.asset("assets/home/card_eclipse.svg",
                width: 60, height: 140, fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 42.0),
            child: SvgPicture.asset("assets/home/card_action.svg",
                width: 12.63, height: 21.80, fit: BoxFit.cover),
          ),
        )
      ]),
    );
  }
}
