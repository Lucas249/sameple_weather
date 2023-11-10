import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../features/features.dart';

import 'base/base.dart';
import 'utils/helper/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(
          builder: (context, themeNotifier, child) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              title: 'Flutter Demo',
              theme: themeNotifier.isDark
                  ? ThemeData(
                brightness: Brightness.dark,
              )
                  : ThemeData(
                brightness: Brightness.light,
              ),
              themeMode: ThemeMode.system, routerDelegate: null, routeInformationParser: null,
            );
          },
        ),
      ),
    );
  }
}
