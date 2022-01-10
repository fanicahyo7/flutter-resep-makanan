import 'package:bloc/bloc.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/services/services.dart';

part 'resep_event.dart';
part 'resep_state.dart';

class ResepBloc extends Bloc<ResepEvent, ResepState> {
  ResepBloc() : super(ResepInitial()) {
    on<FetchResep>((event, emit) async {
      try {
        emit(ResepLoading());
        ResepListModel reseps = await ResepServices().getNewReseps();
        emit(ResepLoaded(reseps));
      } catch (e) {
        emit(ResepFailed(e.toString()));
      }
    });
  }
}
