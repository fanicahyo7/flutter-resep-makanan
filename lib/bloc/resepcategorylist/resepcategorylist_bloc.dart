import 'package:bloc/bloc.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/services/services.dart';
import 'package:meta/meta.dart';

part 'resepcategorylist_event.dart';
part 'resepcategorylist_state.dart';

class ResepcategorylistBloc extends Bloc<ResepcategorylistEvent, ResepcategorylistState> {
  ResepcategorylistBloc() : super(ResepcategorylistInitial()) {
    on<FetchResepByCategory>((event, emit) async {
      try {
        emit(ResepcategoryListLoading());
        ResepListModel reseps =
            await ResepServices().getResepByKategori(event.key);
        emit(ResepcategoryListLoaded(reseps));
      } catch (e) {
        emit(ResepcategoryListFailed(e.toString()));
      }
    });
  }
}
