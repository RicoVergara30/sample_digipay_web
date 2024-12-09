import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:project_digipayweb/screen/Service/service_screen.dart';
import 'package:project_digipayweb/screen/dash_board/base_screen.dart';
import 'package:project_digipayweb/screen/dash_board/dashboard.dart';
import 'package:project_digipayweb/screen/settings/settings_screen.dart';
import 'package:project_digipayweb/screen/transasction/tranasaction_screen.dart';

String selectPage = html.window.localStorage['selectedPage'] ?? "/Dashboard";
final Map<String, Widget Function()> routes = {
  "/Base_Screen": () => const BaseScreen(),
  "/Dashboard": () => const DashboardPage(),
  "/Transaction": () => const TransactionScreen(),
  "/Service": () => const AddServicePage(),
  "/Setting": () => const SettingScreen()
};

Widget getCurrentPage() {
  if (selectPage.isNotEmpty) {
    String route = selectPage;
    html.window.history.pushState(null, '', route);
    return routes[route]?.call() ?? const DashboardPage();
  }

  // Fallback to loading indicator if no route is selected
  return const CircularProgressIndicator();
}
