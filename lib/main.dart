import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.orange[900],
          accentColor: Colors.amberAccent[200],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.amberAccent[200],
            textTheme: ButtonTextTheme.primary,
          )),
      home: ListaTransferencias(),
    );
  }
}
