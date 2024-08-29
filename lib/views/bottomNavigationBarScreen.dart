// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:AstrowayCustomer/controllers/bottomNavigationController.dart';
import 'package:AstrowayCustomer/controllers/chatController.dart';
import 'package:AstrowayCustomer/controllers/history_controller.dart';
import 'package:AstrowayCustomer/controllers/homeController.dart';
import 'package:AstrowayCustomer/controllers/liveController.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/splashController.dart';
import '../utils/AppColors.dart';
import '../utils/global.dart' as global;

class BottomNavigationBarScreen extends StatefulWidget {
  final int index;

  BottomNavigationBarScreen({this.index = 0});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final HomeController homeController = Get.find<HomeController>();
  HistoryController historyController = Get.find<HistoryController>();
  LiveController liveController = Get.find<LiveController>();
  ChatController chatController = Get.find<ChatController>();
  SplashController splashController = Get.find<SplashController>();
  BottomNavigationController bottomNavigationController =
  Get.find<BottomNavigationController>();

  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // global.exitAppDialog();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: bottomNavigationController
            .screens()
            .elementAt(bottomNavigationController.bottomNavIndex),
        bottomNavigationBar: kIsWeb
            ? SizedBox()
            : DotCurvedBottomNav(
          scrollController: _scrollController,
          hideOnScroll: true,
          indicatorColor: Colors.white,
          backgroundColor: Get.theme.primaryColorLight,
          animationDuration: const Duration(milliseconds: 100),
          animationCurve: Curves.ease,
          selectedIndex: bottomNavigationController.bottomNavIndex,
          indicatorSize: 5,
          borderRadius: 30,
          height: 70,
          onTap: (index) async {
            setState(() {
              _currentPage = index;
              bottomNavigationController.setBottomIndex(
                  index, bottomNavigationController.historyIndex);
            });

            if (index == 2) {
              bool isLogin = await global.isLogin();
              if (isLogin) {
                global.showOnlyLoaderDialog(context);
                await bottomNavigationController.getLiveAstrologerList();
                global.hideLoader();
              }
            } else if (index == 4) {
              bool isLogin = await global.isLogin();
              if (isLogin) {
                global.showOnlyLoaderDialog(context);
                await global.splashController.getCurrentUserData();
                await historyController.getPaymentLogs(
                    global.currentUserId!, false);
                historyController.walletTransactionList = [];
                await historyController.getWalletTransaction(
                    global.currentUserId!, false);
                global.hideLoader();
              }
            }
          },
          items: [
            Icon(
              Icons.home,
              color: _currentPage == 0
                  ? Get.theme.primaryColor
                  : Colors.white,
            ),
            Icon(
              Icons.chat,
              color: _currentPage == 1
                  ? Get.theme.primaryColor
                  : Colors.white,
            ),
            Icon(
              Icons.live_tv,
              color: _currentPage == 2
                  ? Get.theme.primaryColor
                  : Colors.white,
            ),
            Icon(
              Icons.call,
              color: _currentPage == 3
                  ? Get.theme.primaryColor
                  : Colors.white,
            ),
            Icon(
              Icons.edit_calendar_sharp,
              color: _currentPage == 4
                  ? Get.theme.primaryColor
                  : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
