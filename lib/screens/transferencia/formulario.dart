import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/dao/transferencia_dao.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _titulo = "Criando Transferência";

const _campoNumeroContaNome = "Número da conta";
const _campoNumeroContaDica = "000";

const _campoValorNome = "Valor";
const _campoValorDica = "0.00";

const _confirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TransferenciaDao _dao = TransferenciaDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _campoNumeroContaNome,
                dica: _campoNumeroContaDica),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _campoValorNome,
                dica: _campoValorDica,
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text(_confirmar),
              onPressed: () {
                _criaTransferencia(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final Transferencia transferenciaCriada =
          Transferencia(0, valor, numeroConta);
      _dao.save(transferenciaCriada).then((id) => Navigator.pop(context));
    }
  }
}
