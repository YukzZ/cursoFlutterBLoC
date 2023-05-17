part of 'counter_cubit.dart';
//Para saber el estado de la información
//Equetable ayuda a saber si un estado es el mismo que el anterior
class CounterState extends Equatable{

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0,
  });

  // Copiar el estado anterior y ver si tiene algún cambio reemplazar el valor
  copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object?> get props => [counter, transactionCount];
  
}
