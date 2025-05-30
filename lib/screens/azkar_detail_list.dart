import 'package:azkar/providers/azkar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AzkarListPage extends StatelessWidget {
  final String category;

  const AzkarListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Provider.of<AzkarProvider>(
                context,
                listen: false,
              ).resetCategory(category);
            },
          ),
        ],
      ),
      body: Container(
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
        child: Consumer<AzkarProvider>(
          builder: (context, azkarProvider, child) {
            final azkar = azkarProvider.azkarCategories[category]!;

            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: azkar.length,
              itemBuilder: (context, index) {
                final zikr = azkar[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            zikr.text,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontSize: 18, height: 1.8),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      zikr.isCompleted
                                          ? Colors.green
                                          : Colors.teal,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '${zikr.currentCount}/${zikr.totalCount}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.refresh,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      azkarProvider.resetZikr(category, index);
                                    },
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed:
                                        zikr.isCompleted
                                            ? null
                                            : () {
                                              azkarProvider.incrementZikr(
                                                category,
                                                index,
                                              );
                                            },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          zikr.isCompleted
                                              ? Colors.green
                                              : Colors.teal,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      zikr.isCompleted ? 'مكتمل' : 'تسبيح',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          194,
                                          227,
                                          192,
                                        ),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (zikr.totalCount > 1) ...[
                            SizedBox(height: 12),
                            LinearProgressIndicator(
                              value: zikr.currentCount / zikr.totalCount,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                zikr.isCompleted ? Colors.green : Colors.teal,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
