/******************************************************************************
 *                 Copyright © AERO Informática Ltda 2024                     *
 *                                                                            *
 *  Nome do arquivo: SingInScreen.dart                                        *
 *  Localização: src/_screen.dart                                             *
 *                                                                            *
 *  Autor: Deimar Jose Marquez ⛬                                             *
 *  Data: 29/10/2024                                                          *
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String Label;
  final bool isobscure;
  final List<TextInputFormatter>? inputformater;

  CustomTextField({
    super.key,
    required this.icon,
    required this.Label,
    this.isobscure = false,
    this.inputformater,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isobscure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: widget.inputformater,
        obscureText: _isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isobscure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          labelText: widget.Label,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
