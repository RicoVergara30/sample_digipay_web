import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:project_digipayweb/components/basedURL/routes.dart';
import 'package:project_digipayweb/screen/dash_board/dashboard.dart';
import 'package:project_digipayweb/widgets/MenuDrawerTextDesign.dart';

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

    ///LOADING INDICATOR
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            onHovered = false;
          },
        );
      },
      child: MouseRegion(
        child: Material(
          child: Stack(
            children: [
              ///CONTENT / PAGE
              SizedBox(
                child: Scaffold(
                  body: getCurrentPage(),
                ),
              ),

              ///DRAWER
              MouseRegion(
                onHover: (event) {
                  setState(
                    () {
                      onHovered = true;
                    },
                  );
                },
                onExit: (event) {
                  setState(
                    () {
                      onHovered = false;
                    },
                  );
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(5, 5))
                    ],
                  ),
                  duration: const Duration(milliseconds: 200),
                  width: onHovered ? 230 : 60,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      ///LOGO
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
                                    width: 100,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      ///MENU
                      Expanded(
                        child: ListView(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                width: 230,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: MenuDrawerTextDesign(
                                        menuTitle: onHovered ? "Dashboard" : "",
                                        icon: Icons.dashboard,
                                        dropdown: false,
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            selectPage = '/Dashboard';
                                          },
                                        );
                                      },
                                    ),
                                    ListTile(
                                      title: MenuDrawerTextDesign(
                                        menuTitle:
                                            onHovered ? "Transaction" : "",
                                        icon: Icons.money,
                                        dropdown: false,
                                        // suffixIcon: isDropdownOpen
                                        //     ? Icons.keyboard_arrow_down_outlined
                                        //     : Icons
                                        //         .keyboard_arrow_right_outlined,
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            selectPage = '/Transaction';
                                            isDropdownOpen =
                                                !isDropdownOpen; // Toggle dropdown
                                          },
                                        );
                                      },
                                    ),
                                    ListTile(
                                      title: MenuDrawerTextDesign(
                                        menuTitle: onHovered ? "Setting" : "",
                                        icon: Icons.settings,
                                        dropdown: false,
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            selectPage = '/Setting';
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ListTile(
                      //   title: MenuDrawerTextDesign(
                      //     menuTitle: onHovered ? "Logout" : "",
                      //     icon: Icons.logout,
                      //     dropdown: false,
                      //   ),
                      //   onTap: () {
                      //     setState(
                      //       () {
                      //         selectPage = '/Login';
                      //       },
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
