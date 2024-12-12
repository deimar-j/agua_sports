/// *****************************************************************************
///  Copyright © AERO Informática Ltda 2024
///
///  Nome do arquivo: SingInScreen.dart
///  Localização: src/_screen.dart
///
///  Autor: Deimar Jose Marquez ⛬
///  Data: 29/10/2024
/// *****************************************************************************

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/home/Components/category_tile.dart';
import 'package:flutter_application_1/src/pages/auth/Components/Custom_text_field.dart';
import 'package:flutter_application_1/src/config/app_data.dart' as appdata;

import '../auth/Sign_In_Screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Varas de pescas';
  bool isMenuExpanded = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 22, 31, 24),
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Agua',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Sport',
                      style: TextStyle(
                        color: CustomColors.Customcontrastcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: badges.Badge(
                  badgeContent: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: CustomColors.Customcontrastcolor,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            // Grid de Productos con espacio superior
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 100), // Aquí agregamos el espacio superior
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 10, // Ejemplo
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Producto ${index + 1}',
                          style: TextStyle(
                            color: CustomColors.Customcontrastcolor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Menú Plegable de Categorías
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: 0,
              left: 0,
              right: 0,
              height: isMenuExpanded ? 300 : 60, // Ajusta la altura del menú
              child: Container(
                color: Colors.white.withOpacity(0.9),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Categorías',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isMenuExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                        onPressed: () {
                          setState(() {
                            isMenuExpanded = !isMenuExpanded;
                          });
                        },
                      ),
                    ),
                    if (isMenuExpanded)
                      Expanded(
                        child: ListView(
                          children: appdata.categories.map((category) {
                            return ListTile(
                              title: Text(category),
                              onTap: () {
                                setState(() {
                                  selectedCategory = category;
                                  isMenuExpanded = false; // Cierra el menú
                                });
                              },
                              selected: category == selectedCategory,
                              selectedTileColor: Colors.grey[200],
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
