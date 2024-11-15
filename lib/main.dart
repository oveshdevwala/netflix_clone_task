import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/features/app/app.dart';
import 'package:netflix_clone/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        //  minTextAdapt: true,
        // splitScreenMode: true,
        builder: (context, child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppPage(),
      );
    });
  }
}
