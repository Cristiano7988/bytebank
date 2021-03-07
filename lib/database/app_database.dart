import 'package:bytebank/models/transferencia.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE transferencias('
            'id INTEGER PRIMARY KEY, '
            'valor FLOAT, '
            'numero_conta INTEGER)');
      },
      version: 1,
      // onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Transferencia transferencia) {
  return createDatabase().then((db) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap['valor'] = transferencia.valor;
    transferenciaMap['numero_conta'] = transferencia.numeroConta;
    return db.insert('transferencias', transferenciaMap);
  });
}

Future<List<Transferencia>> findAll() {
  return createDatabase().then((db) {
    return db.query('transferencias').then((maps) {
      final List<Transferencia> transferencias = List();
      for (Map<String, dynamic> map in maps) {
        final Transferencia transferencia = Transferencia(
          map['id'],
          map['valor'] is String ? double.parse(map['valor']) : map['valor'],
          map['numero_conta'],
        );
        transferencias.add(transferencia);
      }
      return transferencias;
    });
  });
}
