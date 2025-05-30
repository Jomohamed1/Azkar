import 'package:azkar/providers/azkar_provider.dart';

import 'package:azkar/screens/azkar_detail_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AzkarGrid extends StatelessWidget {
  const AzkarGrid({super.key});

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'أذكار الصباح':
        return Icons.wb_sunny;
      case 'أذكار المساء':
        return Icons.brightness_3;
      case 'أذكار الصلاة':
        return Icons.mosque;
      case 'أذكار النوم':
        return Icons.bedtime;
      case 'أذكار الاستيقاظ':
        return Icons.alarm;
      default:
        return Icons.book;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: Provider.of<AzkarProvider>(context).azkarCategories.length,
        itemBuilder: (context, index) {
          final categories =
              Provider.of<AzkarProvider>(context).azkarCategories.keys.toList();
          final category = categories[index];
          final azkar =
              Provider.of<AzkarProvider>(context).azkarCategories[category]!;
          final completedCount = azkar.where((z) => z.isCompleted).length;

          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AzkarListPage(category: category),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getCategoryIcon(category),
                        size: 40,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 12),
                      Text(
                        category,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '$completedCount/${azkar.length} مكتمل',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value:
                            azkar.isEmpty ? 0 : completedCount / azkar.length,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
