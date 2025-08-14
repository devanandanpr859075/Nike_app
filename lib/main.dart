// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:nike_ecom/view_models/home_viewmodel.dart';
// import 'package:provider/provider.dart';
// import 'firebase_options.dart';
//
// // ViewModels
// import 'package:nike_ecom/view_models/signup_viewmodel.dart';
// import 'package:nike_ecom/view_models/details_viewmodel.dart';
// import 'package:nike_ecom/view_models/login_viewmodel.dart';
//
// // Views
// import 'package:nike_ecom/views/splash_screen.dart';
// import 'package:nike_ecom/views/NikeEmailEntryApp.dart';
// import 'package:nike_ecom/views/NikeMemberFormApp.dart';
// import 'package:nike_ecom/Widgets/Nav_bar.dart';
//
// // Models
// import 'package:nike_ecom/model/user_model.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const NikeApp());
// }
//
// class NikeApp extends StatelessWidget {
//   const NikeApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => SignupViewModel()),
//         ChangeNotifierProvider(create: (_) => Signup_Password_ViewModel()),
//         ChangeNotifierProvider(create: (_) => LoginViewModel()),
//         ChangeNotifierProvider(create: (_) => HomeViewModel()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Nike UI',
//         theme: ThemeData(fontFamily: 'Helvetica'),
//         initialRoute: '/',
//         routes: {
//            '/': (context) => const SplashScreen(),
//           '/email': (context) => const EmailEntryScreen(),
//           '/password': (context) {
//             final email = ModalRoute.of(context)?.settings.arguments as String? ?? '';
//             return NikeMemberFormScreen(email: email);
//           },
//           '/home': (context) {
//             final user = ModalRoute.of(context)?.settings.arguments as Email_UserModel?;
//             return BottomNavWrapper();
//           },
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:nike_ecom/views/Address%20Input%20Page.dart';
import 'package:nike_ecom/views/CheckoutPage.dart';
import 'package:nike_ecom/views/ErrorPage.dart';
import 'package:nike_ecom/views/LoadingPage.dart';
import 'package:nike_ecom/views/OrderSuccessPage.dart';
import 'package:nike_ecom/views/OrderSummaryPage.dart';
import 'package:nike_ecom/views/OrderTrackPage.dart';
import 'package:nike_ecom/views/PaymentPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Flow',
      debugShowCheckedModeBanner: false,
      home:  EcomFlow(),
    );
  }
}

class EcomFlow extends StatelessWidget {
  EcomFlow({super.key});
  final Color bg = Color(0xFF13042E);
  final Color accent = Color(0xFF1E0D4D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [

          const CheckoutPage(),const AddressPage(),
          const OrderSummaryPage(),
          const PaymentPage(),
          const LoadingPage(),
          const OrderSuccessPage(),
          const OrderTrackPage(),
          const ErrorPage(),
        ],
      ),
    );
  }
}
