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
import "package:flutter_application_1/src/pages/auth/Components/Custom_text_field.dart";
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupTela extends StatelessWidget {
  SignupTela({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 109, 87),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width, // Cambiado de size.height a size.width
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ),

                  // Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 45,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          icon: Icons.email,
                          Label: 'Email',
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          Label: 'Senha',
                          isobscure: true,
                        ),
                        CustomTextField(
                          icon: Icons.person,
                          Label: 'Nome',
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          Label: 'Celular',
                          inputformater: [phoneFormatter],
                        ),
                        CustomTextField(
                          icon: Icons.file_copy,
                          Label: 'CPF',
                          inputformater: [cpfFormatter],
                        ),
                        const SizedBox(
                            height: 20), // Espaciado extra antes del botón
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 97, 109, 87),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              // Acción para el botón de registrar usuario
                            },
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Botón de retroceso
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
