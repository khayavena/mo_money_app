import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mo_money_app/shared_components/util/cusmtom_colors.dart';
import 'package:mo_money_app/shared_components/widget/loader/app_loading_widget.dart';

import '../../../shared_components/widget/button/BigTextWidget.dart';
import '../../../shared_components/widget/button/back_button_widget.dart';
import '../../comon/result_status.dart';
import '../../login/bloc/get_profile_bloc.dart';
import '../../login/bloc/get_profile_event.dart';
import '../../login/bloc/get_profile_state.dart';
import '../constants/transaction_analytics_events.dart';
import '../widget/card_table_widget.dart';

@RoutePage()
class CardDetailPage extends StatefulWidget {
  const CardDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetProfileBloc>().add(GetUserProfileEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: BlocConsumer<GetProfileBloc, GetProfileState>(
          listener: (context, state) {
        switch (state.status) {
          case ResultStatus.init:
            log(TransactionAnalyticsEvents.transactionInitEvent);
            break;
          case ResultStatus.done:
            log(TransactionAnalyticsEvents.transactionDoneEvent);
            break;
          case ResultStatus.failed:
            log(TransactionAnalyticsEvents.transactionFailedEvent);
            break;
        }
      }, builder: (context, state) {
        if (state.status == ResultStatus.init) {
          return const AppLoadingWidget();
        }
        return Column(
          children: [
            const BigTextWidget(text: "My Card", color: secondaryColorDark),
            const SizedBox(height: 50),
            AspectRatio(
              aspectRatio: 1.3,
              child: Container(
                width: 335,
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 220,
                child: SvgPicture.asset(
                  "assets/home/card_detail.svg",
                  width: double.maxFinite,
                ),
              ),
            ),
            const SizedBox(height: 50),
            CardTableWidget(name: state.user?.username),
          ],
        );
      }),
    );
  }
}
