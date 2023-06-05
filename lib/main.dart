import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/Models/nots_models.dart';
import 'package:my_app/state_management/provider/auth_provider.dart';
import 'package:my_app/state_management/provider/count_provider.dart';
import 'package:my_app/state_management/provider/example_one_provider.dart';
import 'package:my_app/state_management/provider/favourite_provider.dart';
import 'package:my_app/state_management/provider/theme_changer_provider.dart';
import 'package:my_app/state_management/screen/favourite/login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        final themechanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themechanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.teal,
              )),
          home: const LoginScreen(),
        );
      }),
    );
  }
}
