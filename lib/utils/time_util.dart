class TimeUtil {
  TimeUtil._();

  static int getApartSeconds() {
    DateTime now = DateTime.now();
    return now.millisecondsSinceEpoch ~/ 1000;
  }
}
