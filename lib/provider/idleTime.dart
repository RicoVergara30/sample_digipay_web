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
      const Duration(seconds: 5),
      () async {
        // Stop the timer when it times out
        stop();

        // Show timeout alert dialog
        _showTimeoutDialog(context);
      },
    );
  }

  // Function to show the AlertDialog with timeout
  void _showTimeoutDialog(BuildContext context) {
    // Set dialog as modal to prevent outside interaction
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        // Automatically close the dialog after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(); // Dismiss the dialog
            // Navigate to the TransactionScreen
            Navigator.of(_buildContext).push(
              MaterialPageRoute(
                builder: (_) => const TransactionScreen(),
              ),
            );
          }
        });

        return AlertDialog(
          title: const Text('Timeout Alert'),
          content: const Text('You have been idle for too long.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog manually
                // Navigate to the TransactionScreen immediately
                Navigator.of(_buildContext).push(
                  MaterialPageRoute(
                    builder: (_) => const TransactionScreen(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
