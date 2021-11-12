import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return "ねこマムシの法則";
});


final messageProvider = Provider<String>((ref) {
  return "ここにメッセージが届くよ";
});


final countProvider = StateProvider<int>((ref) => 0);