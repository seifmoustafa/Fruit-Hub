import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singleton.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setupGetit();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          fontFamily: 'Cairo'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routName,
      home: const SplashView(),
    );
  }
}
