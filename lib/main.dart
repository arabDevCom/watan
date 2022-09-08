import 'package:elwatn/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elwatn/injector.dart'
as injector;

import 'app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setup();
  BlocOverrides.runZoned(
        () => runApp(const Elwatn()),
    blocObserver: AppBlocObserver(),
  );
}
