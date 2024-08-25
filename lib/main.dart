import 'package:educational_quiz_game/features/auth/provider/auth_provider.dart';
import 'package:educational_quiz_game/firebase_options.dart';
import 'package:educational_quiz_game/utils/app_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/auth/views/login.dart';
import 'features/home/views/home_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userSignIn = ref.watch(userFuture);
    return MaterialApp(
      title: 'Educational Quiz Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.lato()
        )
      ),
      home: userSignIn.when(
        data: (user) {
          if (user != null) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stack) => Scaffold(
          body: Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
      builder: FlutterSmartDialog.init(),
    );
  }
}
