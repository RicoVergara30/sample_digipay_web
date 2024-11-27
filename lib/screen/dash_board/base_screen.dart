import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:project_digipayweb/components/basedURL/routes.dart';

import '../../widgets/MenuDrawerTextDesign.dart';
import 'dashboard.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool onHovered = false;
  String selectPage = "/Dashboard";
  bool isDropdownOpen = false;

  Widget getCurrentPage() {
    if (selectPage.isNotEmpty) {
      String route = selectPage;
      html.window.history.pushState(null, '', route);
      return routes[route]?.call(context) ?? const DashboardPage();
    }

    // LOADING INDICATOR
    return const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onHovered = false;
        });
      },

      //CONTENT / PAGE
      child: MouseRegion(
        child: Material(
          child: Stack(
            children: [
              // CONTENT / PAGE
              Row(
                children: [
                  // DRAWER
                  MouseRegion(
                    onHover: (event) {
                      setState(() {
                        onHovered = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        onHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: onHovered ? 230 : 65,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // LOGO
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: 230.0,
                              color: Colors.white,
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    Image.asset(
                                      'assets/logo2.png',
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Visibility(
                                      visible: onHovered,
                                      child: Image.asset(
                                        'assets/logo1.png',
                                        width: 90,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // MENU
                          Expanded(
                            child: ListView(
                              shrinkWrap:
                                  true, // Prevents overflow in the submenu
                              children: [
                                ListTile(
                                  title: MenuDrawerTextDesign(
                                    menuTitle: onHovered ? "Dashboard" : "",
                                    icon: Icons.dashboard,
                                    dropdown: false,
                                    suffixIcon: isDropdownOpen
                                        ? Icons.keyboard_arrow_down_outlined
                                        : Icons.keyboard_arrow_right_outlined,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPage = '/Dashboard';
                                      isDropdownOpen = !isDropdownOpen;
                                    });
                                  },
                                ),
                                ListTile(
                                  title: MenuDrawerTextDesign(
                                    menuTitle: onHovered ? "Transaction" : "",
                                    icon: Icons.money,
                                    dropdown: false,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPage = '/Transaction';
                                    });
                                  },
                                ),
                                ListTile(
                                  title: MenuDrawerTextDesign(
                                    menuTitle: onHovered ? "Setting" : "",
                                    icon: Icons.settings,
                                    dropdown: false,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPage = '/Setting';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // CONTENT AREA (Dashboard)
                  Expanded(
                    child: getCurrentPage(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
