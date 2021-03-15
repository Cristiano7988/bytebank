import 'package:bytebank/models/cliente.dart';
import 'package:bytebank/screens/autencticacao/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      child: ByteBankApp(),
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cliente(),
        ),
      ],
    ),
  );
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green[200],
          accentColor: Colors.green[900],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green[900],
            textTheme: ButtonTextTheme.primary,
          )),
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Padding(
            child: Text("Snapshot Error"),
            padding: EdgeInsets.all(8),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Login();
        }

        // Carregando
        return Container();
      },
    );
  }
}
