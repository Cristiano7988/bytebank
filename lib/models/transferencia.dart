class Transferencia {
  final int id;
  final double valor;
  final int numeroConta;

  Transferencia(
    this.id,
    this.valor,
    this.numeroConta,
  );

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, numeroConta: $numeroConta}';
  }
}
