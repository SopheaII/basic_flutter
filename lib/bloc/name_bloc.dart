import 'package:bloc/bloc.dart';

abstract class NameEvent {}
class SetNameEvent extends NameEvent {
  final String name;
  SetNameEvent(this.name);
}

class NameState {
  final String name;
  NameState(this.name);
}

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(NameState('')) {
    on<SetNameEvent>((event, emit) => emit(NameState(event.name)));
  }
}
