import 'package:bytebank/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bytebank/components/mensagem.dart';
import 'package:bytebank/screens/autencticacao/registrar.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';

class Login extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 455,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: _construirFormulario(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }

  Widget _construirFormulario(context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            validator: (value) =>
                Validator.email(value) ? 'Email inválido' : null,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            maxLength: 255,
            keyboardType: TextInputType.text,
            controller: _emailController,
          ),
          SizedBox(height: 20),
          TextFormField(
            validator: (value) {
              if (value.length == 0) {
                return 'Informe uma senha';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Senha',
            ),
            maxLength: 15,
            keyboardType: TextInputType.text,
            obscureText: true,
            controller: _senhaController,
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: OutlineButton(
              textColor: Theme.of(context).accentColor,
              highlightColor: Color.fromRGBO(71, 161, 56, 0.2),
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).accentColor,
              ),
              child: Text('LOGAR'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _singIn(context);
                }
              },
            ),
          ),
          SizedBox(height: 15),
          OutlineButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Registrar(),
                ),
              );
            },
            highlightColor: Color.fromRGBO(71, 161, 56, 0.2),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).accentColor,
            ),
            textColor: Theme.of(context).accentColor,
            child: Text(
              'Criar uma conta >',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  _singIn(context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _senhaController.text)
          .then((user) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
            (route) => false);
      });
    } on FirebaseAuthException catch (erro) {
      exibirAlerta(
        context: context,
        titulo: 'ATENÇÃO',
        content: "Email ou Senha incorretos!",
      );
    }
  }
}
