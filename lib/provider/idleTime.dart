// import 'dart:async';
// import 'dart:html' as html;
// import 'dart:ui';
//
// class IdleTimeManager {
//   final VoidCallback onIdle;
//   bool _isDialogActive = false;
//   Timer? _timer;
//
//   IdleTimeManager({required this.onIdle});
//
//   void reset() {
//     if (!_isDialogActive) {
//       _timer?.cancel();
//       startTimer();
//     }
//   }
//
//   void start() {
//     startTimer();
//   }
//
//   void startTimer() {
//     _timer = Timer(const Duration(seconds: 5), onIdle);
//   }
//
//   void dispose() {
//     _timer?.cancel();
//   }
//
//   void setDialogActive(bool isActive) {
//     _isDialogActive = isActive;
//     html.window.localStorage['onIdle'] = isActive.toString();
//   }
//
//   void removeLocalStorage() {
//     html.window.localStorage.remove('onIdle');
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_digipayweb/screen/transasction/tranasaction_screen.dart';

class TimerProvider extends ChangeNotifier {
  Timer _timer = Timer(Duration.zero, () {});
  late BuildContext _buildContext;

  BuildContext get buildContext => _buildContext;

  set buildContext(BuildContext value) {
    _buildContext = value;
    notifyListeners();
  }

  Timer get timer => _timer;

  set timer(Timer value) {
    _timer = value;
    notifyListeners();
  }

  Future<void> stop() async {
    _timer.cancel();
    _timer = Timer(Duration.zero, () {});
  }

  void startTimer(BuildContext context) {
    if (_timer != Timer(Duration.zero, () {})) {
      _timer.cancel();
    }
    _timer = Timer(
      const Duration(minutes: 50),
      () async {
        //FUNCTION WHEN THE IDLE TIMER TIMED OUT

        stop();

        Navigator.of(buildContext).push(MaterialPageRoute(
            builder: (_) =>
                const TransactionScreen())); // Change this to your login screen route
      },
    );
  }
}
