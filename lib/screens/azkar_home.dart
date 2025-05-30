import 'package:azkar/providers/theme_provider.dart';
import 'package:azkar/widgets/azkar_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AzkarHomePage extends StatelessWidget {
  const AzkarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    appInfo() {
      return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(title: Text('data'));
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: appInfo, icon: Icon(Icons.info_outline)),
        title: Text('الأذكار الإسلامية'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      body: AzkarGrid(),
    );
  }
}
