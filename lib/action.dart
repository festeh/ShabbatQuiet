import 'dao.dart';
import 'package:collection/collection.dart';


DateTime findDate(List<Item> items, String category) {
  return
    DateTime.parse(
        items.firstWhereOrNull((element) => element.category == category)!.date!
    );
}

Action calculateAction(List<Item> items) {
  final nextCandles = findDate(items, "candles");
  final nextHavdalah = findDate(items, "havdalah");
  final now = DateTime.now();

  //        1           2           3       4
  // --- H --- M --------------- C --- M ------- H ----

  // TODO Yom Tov support?
  if (now.isAfter(nextCandles) && now.isBefore(nextHavdalah)) {
    // 3 - after candles before midnight
    return Action(nextActionTime: nextHavdalah, setNow: DNDState.ON);
  } else if (now.isBefore(nextCandles) && now.isBefore(nextHavdalah) && nextCandles.isBefore(nextHavdalah)) {
    // 2 - after midnight after last havdalah before candles
    return Action(nextActionTime: nextCandles, setNow: DNDState.OFF);
  }  else if (now.isBefore(nextCandles) && now.isBefore(nextHavdalah) && nextHavdalah.isBefore(nextCandles)) {
    // 4 - after midnight after last candles before havdalah
    return Action(nextActionTime: nextHavdalah, setNow: DNDState.ON);
  } else if (now.isAfter(nextHavdalah) && now.isBefore(nextCandles)) {
    // 1 - after havdalah before midnight
    return Action(nextActionTime: nextCandles, setNow: DNDState.OFF);
  } else {
    // can this happen?
    print(
        "Unhandled time: current time: ${now}, "
            "next candles: ${nextCandles}, "
            "next havdalah: ${nextHavdalah}"
    );
    return Action(nextActionTime: nextCandles, setNow: DNDState.OFF);
  }
}

class Action {
  DateTime nextActionTime;
  DNDState setNow;

  Action({
    required this.nextActionTime,
    required this.setNow
  });
}

enum DNDState { ON, OFF }