import 'package:bloc/bloc.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/services/services.dart';
import 'package:meta/meta.dart';

part 'newresep_event.dart';
part 'newresep_state.dart';

class NewresepBloc extends Bloc<NewresepEvent, NewresepState> {
  NewresepBloc() : super(NewresepInitial()) {
    on<FetchNewResep>((event, emit) async {
      try {
        emit(NewResepLoading());
        ResepListModel reseps = await ResepServices().getNewReseplimit();
        emit(NewResepLoaded(reseps));
      } catch (e) {
        emit(NewResepFailed(e.toString()));
      }
    });
  }
}
