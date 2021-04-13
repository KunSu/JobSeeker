import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boards_event.dart';
part 'boards_state.dart';

class BoardsBloc extends Bloc<BoardsEvent, BoardsState> {
  BoardsBloc() : super(BoardsInitial());

  @override
  Stream<BoardsState> mapEventToState(
    BoardsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
