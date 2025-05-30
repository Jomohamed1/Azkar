class Zikr {
  final String text;
  final int totalCount;
  int currentCount;
  bool isCompleted;

  Zikr({
    required this.text,
    required this.totalCount,
    this.currentCount = 0,
    this.isCompleted = false,
  });

  void increment() {
    if (currentCount < totalCount) {
      currentCount++;
      isCompleted = currentCount == totalCount;
    }
  }

  void reset() {
    currentCount = 0;
    isCompleted = false;
  }
}
