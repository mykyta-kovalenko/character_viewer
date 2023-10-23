import 'package:flutter/material.dart';

import 'app.dart';
import 'config/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const App());
}
