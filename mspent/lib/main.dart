import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import './providers/transactions.dart';

import 'screens/availableCash.dart';
import 'screens/home_screen.dart';

void main() async{ //async
  //init hive
  await Hive.initFlutter();

  //open box
  await Hive.openBox('transactions');

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Transactions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'mSpent',
        theme: ThemeData(
          fontFamily: 'QuickSand',
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        home: const HomeScreen(),
        routes: {
          'availableCash': (context) => const AvailableCash(),
        },
      ),
    );
  }
}
