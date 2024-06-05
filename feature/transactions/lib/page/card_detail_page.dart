import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:common/result_status.dart';
import 'package:common/shared_components/util/cusmtom_colors.dart';
import 'package:common/shared_components/widget/button/BigTextWidget.dart';
import 'package:common/shared_components/widget/button/back_button_widget.dart';
import 'package:common/shared_components/widget/loader/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions/bloc/get_card_detail_bloc.dart';
import 'package:transactions/bloc/get_detail_state.dart';

import '../bloc/get_card_detail_event.dart';
import '../constants/transaction_analytics_events.dart';
import '../widget/card_detail_widget.dart';
import '../widget/card_table_widget.dart';

@RoutePage()
class CardDetailPage extends StatefulWidget {
  const CardDetailPage({
    super.key,
  });

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetCardDetailBloc>().add(GetCardDetailEvent());
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
      body: BlocConsumer<GetCardDetailBloc, GetCardDetailState>(
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
            const CardDetailWidget(),
            const SizedBox(height: 50),
            CardTableWidget(cardDetail: state.cardDetail,),
          ],
        );
      }),
    );
  }
}
