import 'package:flutter/material.dart';
import 'package:motion/motion.dart';

import 'app.dart';
import 'config/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  Motion.instance.initialize;

  runApp(const App());
}
