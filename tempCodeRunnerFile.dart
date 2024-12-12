import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendario de Pagos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarioPagos(),
    );
  }
}

class CalendarioPagos extends StatefulWidget {
  @override
  _CalendarioPagosState createState() => _CalendarioPagosState();
}

class _CalendarioPagosState extends State<CalendarioPagos> {
  TextEditingController _controllerNumMeses = TextEditingController();
  TextEditingController _controllerMontoTotal = TextEditingController();
  List<double> _pagosPorMes = [];

  void _calcularPagosPorMes() {
    // Parseamos los valores de entrada a números válidos o asignamos 0 si no son válidos
    int? numMeses = int.tryParse(_controllerNumMeses.text) ?? 0;
    double? montoTotal = double.tryParse(_controllerMontoTotal.text) ?? 0.0;

    if (numMeses > 0 && montoTotal > 0) {
      double montoPorMes = montoTotal / numMeses;
      setState(() {
        _pagosPorMes = List.generate(numMeses, (index) => montoPorMes);
      });
    } else {
      setState(() {
        _pagosPorMes = [];
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
                "Por favor, ingrese un número válido de meses y un monto total positivo."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendario de Pagos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controllerNumMeses,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número de meses'),
            ),
            TextField(
              controller: _controllerMontoTotal,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto total'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calcularPagosPorMes,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Calendario de Pagos:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _pagosPorMes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        'Mes ${index + 1}: \$${_pagosPorMes[index].toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
