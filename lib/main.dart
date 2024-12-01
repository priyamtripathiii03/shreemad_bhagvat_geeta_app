import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/gita_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/home_page_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/shlok_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/views/home_page.dart';
import 'package:shreemad_bhagvat_geeta_app/views/shlok_page.dart';
import 'package:shreemad_bhagvat_geeta_app/views/shlok_preview.dart';
import 'package:shreemad_bhagvat_geeta_app/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BhagwadGitaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShlokProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeChangeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/': (context) => const HomePage(),
          '/shlok': (context) => const ShlokPage(),
          '/shlokPreview': (context) => const ShlokPreviewPage(),
          '/splash': (context) => const SplashScreen(),
        },
      ),
    );
  }
}