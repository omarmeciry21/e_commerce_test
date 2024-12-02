import 'package:e_commerce_test/core/cubit/language_cubit.dart';
import 'package:e_commerce_test/core/routing/app_router.dart';
import 'package:e_commerce_test/core/service_locator.dart';
import 'package:e_commerce_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocProvider(
        create: (context) => LanguageCubit(),
        child: EcommerceMaterialApp(),
      ),
    );
  }
}

class EcommerceMaterialApp extends StatefulWidget {
  const EcommerceMaterialApp({
    super.key,
  });

  @override
  State<EcommerceMaterialApp> createState() => _EcommerceMaterialAppState();
}

class _EcommerceMaterialAppState extends State<EcommerceMaterialApp> {
  @override
  void initState() {
    super.initState();

    context.read<LanguageCubit>().getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: Locale(context.read<LanguageCubit>().languageCode),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
              primaryColor: Color(0xffE42C52),
              scaffoldBackgroundColor: Colors.white,
              fontFamily: GoogleFonts.raleway().fontFamily),
          supportedLocales: S.delegate.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
