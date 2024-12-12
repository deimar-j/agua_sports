/// *****************************************************************************
///  Copyright © AERO Informática Ltda 2024
///
///  Nome do arquivo: SingInScreen.dart
///  Localização: src/_screen.dart
///
///  Autor: Deimar Jose Marquez ⛬
///  Data: 29/10/2024
/// *****************************************************************************

class ItemModel {
  String itemName;
  String imagUrl;
  String unit;
  String prece;
  String description;

  ItemModel(
      {required this.itemName,
      required this.imagUrl,
      required this.description,
      required this.prece,
      required this.unit});
}
