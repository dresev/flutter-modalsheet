import 'package:flutter/material.dart';
import 'package:modalsheet/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              // shadowColor: MaterialStateProperty.all(const Color(0xFFEBEDF7)),
              // overlayColor: MaterialStateProperty.all(const Color(0xFFEBEDF7)),
              foregroundColor:
                  MaterialStateProperty.all(const Color(0xFF1a232d)),
              // surfaceTintColor: MaterialStateProperty.all(const Color(0xFFEBEDF7)),
              // backgroundColor:
              //     MaterialStateProperty.all(const Color(0xFFEBEDF7)),
            ),
          ),
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 42.sp,
              color: const Color(0xFF304154),
            ),
            titleLarge: TextStyle(
              fontSize: 17.sp,
              color: const Color(0xFF273544),
            ),
            bodyMedium: TextStyle(
              fontSize: 11.sp,
              color: const Color(0xFF384c61),
            ),
            labelLarge: TextStyle(
              fontSize: 17.sp,
              color: const Color(0xFFC8D7E6),
            ),
            labelSmall: TextStyle(
              fontSize: 8.sp,
              color: const Color(0xFF6D8CAB),
            ),
          ),
        ),
        home: HomeScreen(),
      );
    });
  }
}
