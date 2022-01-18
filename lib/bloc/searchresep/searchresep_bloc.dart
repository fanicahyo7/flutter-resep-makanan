import 'package:bloc/bloc.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/services/services.dart';
import 'package:meta/meta.dart';

part 'searchresep_event.dart';
part 'searchresep_state.dart';

class SearchresepBloc extends Bloc<SearchresepEvent, SearchresepState> {
  SearchresepBloc() : super(SearchresepInitial()) {
    on<SearchResep>((event, emit) async {
      try {
        emit(SearchresepLoading());
        ResepListModel reseps =
            await ResepServices().searchResep(event.key);
        emit(SearchresepLoaded(reseps));
      } catch (e) {
        emit(SearchresepFailed(e.toString()));
      }
    });
  }
}
