import 'package:flutter/material.dart';
import 'package:project_digipayweb/screen/dash_board/base_screen.dart';
import 'package:project_digipayweb/screen/dash_board/dashboard.dart';
import 'package:project_digipayweb/screen/settings/settings_screen.dart';
import 'package:project_digipayweb/screen/transasction/tranasaction_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/Base_Screen": (context) => const BaseScreen(),
  "/Dashboard": (context) => const DashboardPage(),
  "/Transaction": (context) => const TransactionScreen(),
  "/Setting": (context) => const settingScreen()
};
