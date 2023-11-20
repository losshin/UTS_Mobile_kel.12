import 'package:flutix_kel_12/ui/pages/checkout_page.dart';
import 'package:flutix_kel_12/ui/pages/confirmationPage.dart';
import 'package:flutix_kel_12/ui/pages/splash_page.dart';
import 'package:flutix_kel_12/ui/pages/success_checkout.dart';
import 'package:flutix_kel_12/ui/pages/user_profile.dart';
import 'package:flutter/material.dart';

import 'ui/pages/movies_details_page.dart';
import 'ui/pages/select_seat.dart';
import 'ui/pages/select_schedule.dart';
import 'ui/pages/signUp_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 93, 0, 255)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashPage(),
        '/signUp' : (context) => const SignUpPage(),
        '/signIn' : (context) => const SplashPage(),
        '/userProfile' : (context) => UserProfilePage(),
        '/confirmationPage' : (context) => const ConfirmationPage(),
        '/moviesDetails' : (context) => const MoviesDetailsPage(),
        '/selectSchedule' : (context) => SelectSchedulePage(),
        '/selectSeat' : (context) => const SelectSeatPage(),
        '/checkout' : (context) => const CheckoutPage(),
        '/successCheckout' : (context) => const SuccessCheckout(),
      },
    );
  }
}
