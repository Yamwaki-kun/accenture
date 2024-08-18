import 'package:flutter_bloc/flutter_bloc.dart';

// Definição do evento
abstract class CardEvent {}

class ToggleCardEvent extends CardEvent {
  final int cardId;

  ToggleCardEvent(this.cardId);
}

// Definição do estado
abstract class CardState {}

class CardInitial extends CardState {}

class CardBlurred extends CardState {
  final int cardId;

  CardBlurred(this.cardId);
}

// Implementação do BLoC
class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<ToggleCardEvent>((event, emit) {
      // Lógica para lidar com ToggleCardEvent
      // Se o cartão com o ID fornecido estiver borrado, remova o desfoque; caso contrário, adicione-o.
      if (state is CardBlurred &&
          (state as CardBlurred).cardId == event.cardId) {
        emit(CardInitial());
      } else {
        emit(CardBlurred(event.cardId));
      }
    });
  }
}
