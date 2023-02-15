 import 'package:flutter/material.dart';
import 'package:my_diary/Models/diary_data_model.dart';
import 'Screens/diary_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  // WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DiaryDataAdapter());
  await Hive.openBox("openBox");
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiaryPage(),
    );
  }
}
