import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mo_money_app/features/main/router.gr.dart';
import 'package:mo_money_app/shared_components/util/cusmtom_colors.dart';

import '../../../shared_components/util/amount_helper.dart';
import '../../transactions/page/transactions_page.dart';
import '../widgets/card_balance_widget.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/home_page_navigation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key = const Key("homePage")}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // This redirects the amount of the overlap to the injector
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                expandedHeight: 70,
                flexibleSpace: const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: HomeHeaderWidget(),
                ),
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
              ),
          ],
          // The content of the scroll view
          body: Builder(builder: (context) {
            return Column(
              children: [
                const SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(const CardDetailRoute());
                    },
                    child: CardBalanceWidget(
                      number: AppHelper.generateAmount(),
                    ),),
                const SizedBox(height: 20),
                const HomeNavigationWidget(),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text("Recent Transactions",
                        style: TextStyle(
                            fontSize: 18,
                            color: secondaryColorDark,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                const Expanded(child: TransactionListPage(title: "homePage")),
              ],
            );
          }),
        ),
      ),
    );
  }

}
