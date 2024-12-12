/// *****************************************************************************
///  Copyright © AERO Informática Ltda 2024
///
///  Nome do arquivo: SingInScreen.dart
///  Localização: src/_screen.dart
///
///  Autor: Deimar Jose Marquez ⛬
///  Data: 29/10/2024
/// *****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/auth/Sign_In_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(
            255, 97, 109, 87), // Cambiado a un MaterialColor
            
      ),
      home: SignInScreen(),
    );
  }
}
