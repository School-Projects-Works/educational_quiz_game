import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeNavProvider = StateProvider<int>((ref) => 0);



final difficultyLevelProvider = StateProvider<String>((ref) => 'Easy');