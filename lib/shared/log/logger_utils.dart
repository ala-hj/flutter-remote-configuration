class Logger {
  // register any activity weather it is error or not, if it error , isError variable will return true
  static void write(String text, {bool isError = false}) {
    DateTime _nowTiming = new DateTime.now();
    print(
        '${DateTime(_nowTiming.year, _nowTiming.month, _nowTiming.day, _nowTiming.hour, _nowTiming.minute)} - ** $text [$isError]');
  }
}
