import 'dart:io';

import 'package:flutter/cupertino.dart';

class Cliente extends ChangeNotifier {
  String _nome;
  String _email;
  String _celular;
  String _cpf;
  String _nascimento;
  String _cep;
  String _estado;
  String _cidade;
  String _bairro;
  String _logradouro;
  String _numero;
  String _senha;

  String get nome => _nome;
  String get email => _email;
  String get celular => _celular;
  String get cpf => _cpf;
  String get nascimento => _nascimento;
  String get cep => _cep;
  String get estado => _estado;
  String get cidade => _cidade;
  String get bairro => _bairro;
  String get logradouro => _logradouro;
  String get numero => _numero;
  String get senha => _senha;

  set nome(String value) {
    _nome = value;

    notifyListeners();
  }

  set email(String value) {
    _email = value;
  }

  set celular(String value) {
    _celular = value;
  }

  set cpf(String value) {
    _cpf = value;
  }

  set nascimento(String value) {
    _nascimento = value;
  }

  set cep(String value) {
    _cep = value;
  }

  set estado(String value) {
    _estado = value;
  }

  set cidade(String value) {
    _cidade = value;
  }

  set bairro(String value) {
    _bairro = value;
  }

  set logradouro(String value) {
    _logradouro = value;
  }

  set numero(String value) {
    _numero = value;
  }

  set senha(String value) {
    _senha = value;
  }

  // Tela de cadastro de Cliente
  int _stepAtual = 0;
  File _imagemSelfie;

  int get stepAtual => _stepAtual;
  File get imagemSelfie => _imagemSelfie;

  set stepAtual(int value) {
    _stepAtual = value;

    notifyListeners();
  }

  set imagemSelfie(File value) {
    _imagemSelfie = value;

    notifyListeners();
  }
}
