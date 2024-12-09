import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_digipayweb/components/basedURL/routes.dart';
import 'package:project_digipayweb/provider/idleTime.dart';
import 'package:provider/provider.dart';

import '../../widgets/MenuDrawerTextDesign.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  Timer? _timer;
  bool onHovered = false;
  bool isDropdownOpen = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    final timer = Provider.of<TimerProvider>(context, listen: false);
    timer.startTimer(context);
    timer.buildContext = context;
  }

  void _pauseTimer([_]) {
    _timer?.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerHover: _pauseTimer,
      onPointerMove: _pauseTimer,
      child: GestureDetector(
        onTap: () {
          setState(() {
            onHovered = false;
          });
        },

        //CONTENT / PAGE
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
                                    icon: Icons.dashboard_outlined,
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
                                    menuTitle: onHovered ? "Service" : "",
                                    icon: Icons.settings_suggest_rounded,
                                    dropdown: false,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPage = '/Service';
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
