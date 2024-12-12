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
import 'package:flutter_application_1/src/pages/home/home_tab.dart';

class BaseTela extends StatefulWidget {
  BaseTela({super.key});

  @override
  State<BaseTela> createState() => _BaseTelaState();
}

class _BaseTelaState extends State<BaseTela> {
  int currentIndex = 0;
  final pegeController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pegeController,
        children: [
          const HomeTab(),
          Container(
            color: const Color.fromARGB(255, 97, 99, 87),
          ),
          Container(
            color: const Color.fromARGB(255, 97, 91, 87),
          ),
          Container(
            color: const Color.fromARGB(255, 170, 154, 117),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pegeController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 22, 31, 24),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
