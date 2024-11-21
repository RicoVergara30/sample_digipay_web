import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_digipayweb/screen/dash_board/base_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebTool',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/Base_Screen",
      // routes: routes, // Link the routes map here
      home: BaseScreen(),
    );
  }
}

// class AuthGuard extends StatefulWidget {
//   final Widget child;
//
//   const AuthGuard({super.key, required this.child});
//
//   @override
//   _AuthGuardState createState() => _AuthGuardState();
// }
//
// class _AuthGuardState extends State<AuthGuard> {
//   bool _isAuthenticated = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkAuth();
//   }
//
//   Future<void> _checkAuth() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null) {
//       setState(() {
//         _isAuthenticated = false;
//       });
//       Navigator.pushReplacementNamed(context, AppRoutes.unauthorizedRoute,
//           arguments: 'Unauthorized access. Please log in.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_isAuthenticated) {
//       return const SizedBox.shrink(); // Return an empty widget while navigating
//     }
//     return widget.child;
//   }
// }
