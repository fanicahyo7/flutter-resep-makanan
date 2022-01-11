import 'package:bloc/bloc.dart';
import 'package:flutter_resep_makanan/models/resep_category.dart';
import 'package:flutter_resep_makanan/services/services.dart';
import 'package:meta/meta.dart';

part 'resepcategory_event.dart';
part 'resepcategory_state.dart';

class ResepcategoryBloc extends Bloc<ResepcategoryEvent, ResepcategoryState> {
  ResepcategoryBloc() : super(ResepcategoryInitial()) {
    on<FetchCategory>((event, emit) async {
      try {
        emit(ResepcategoryLoading());
        ResepCategoryModel reseps = await ResepServices().getCategoryResep();
        emit(ResepcategoryLoaded(reseps));
      } catch (e) {
        emit(ResepcategoryFailed(e.toString()));
      }
    });
  }
}
