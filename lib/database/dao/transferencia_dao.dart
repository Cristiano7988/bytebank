import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:sqflite/sqflite.dart';

class TransferenciaDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_valor FLOAT, '
      '$_numeroConta INTEGER)';
  static const String _tableName = 'transferencias';
  static const String _id = 'id';
  static const String _valor = 'valor';
  static const String _numeroConta = 'numero_conta';

  Future<int> save(Transferencia transferencia) async {
    final Database db = await getDatabase();
    Map<String, dynamic> transferenciaMap = _toMap(transferencia);
    return db.insert(_tableName, transferenciaMap);
  }

  Map<String, dynamic> _toMap(Transferencia transferencia) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap[_valor] = transferencia.valor;
    transferenciaMap[_numeroConta] = transferencia.numeroConta;
    return transferenciaMap;
  }

  Future<List<Transferencia>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Transferencia> transferencias = _toList(result);
    return transferencias;
  }

  List<Transferencia> _toList(List<Map<String, dynamic>> result) {
    final List<Transferencia> transferencias = List();
    for (Map<String, dynamic> row in result) {
      final Transferencia transferencia = Transferencia(
        row[_id],
        row[_valor],
        row[_numeroConta],
      );
      transferencias.add(transferencia);
    }
    return transferencias;
  }
}
