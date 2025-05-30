import 'package:azkar/providers/azkar_provider.dart';
import 'package:azkar/providers/theme_provider.dart';
import 'package:azkar/screens/azkar_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AzkarProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'الأذكار الإسلامية',
          theme: themeProvider.isDarkMode ? _darkTheme : _lightTheme,
          home: AzkarHomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

final _lightTheme = ThemeData(
  primaryColor: Colors.teal,
  scaffoldBackgroundColor: Color(0xFFF5F5DC),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
    titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.teal,
    onPrimary: Colors.white,
    secondary: Colors.tealAccent,
    onSecondary: Colors.black87,
    error: Colors.red,
    onError: Colors.white,

    surface: Colors.white,
    onSurface: Colors.black87,
  ),
);

final _darkTheme = ThemeData(
  primaryColor: Colors.teal,
  scaffoldBackgroundColor: Color(0xFF1E1E1E),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF2D2D2D),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardTheme: CardTheme(
    color: Color(0xFF2D2D2D),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.teal,
    onPrimary: Colors.white,
    secondary: Colors.tealAccent,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.black,
    surface: Color(0xFF1E1E1E),

    onSurface: Colors.white,
  ),
);
