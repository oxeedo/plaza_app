import 'package:plaza_ng/theme.dart';
import 'package:flutter/material.dart';
import 'package:plaza_ng/screens/auth/sign_in.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const type = 1;
  static const brandColor = Color(0xFF3C1D6D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignInScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // The primary color typically affects the AppBar and some buttons by default
        primaryColor: brandColor,

        // Create a color scheme based on the brand color
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(brandColor),
        ).copyWith(
          // The secondary color is used for accents (e.g., FloatingActionButton)
          secondary: brandColor,
        ),

        // Customize the AppBar appearance
        appBarTheme: AppBarTheme(
          backgroundColor: brandColor,
          // if you want to customize the icon or text color in the app bar
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Customize ElevatedButton appearance
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: brandColor, // Button background color
            foregroundColor: Colors.white, // Text (and icon) color
            minimumSize: const Size(100, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),

        // Customize TextButton appearance
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: brandColor, // Text (and icon) color
          ),
        ),

        // Customize OutlinedButton appearance
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: brandColor, // Text color
            side: BorderSide(
              color: brandColor, // Border color
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
