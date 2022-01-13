import 'package:bloc/bloc.dart';
import 'package:flutter_resep_makanan/models/resep_detail.dart';
import 'package:flutter_resep_makanan/services/services.dart';
import 'package:meta/meta.dart';

part 'resepdetail_event.dart';
part 'resepdetail_state.dart';

class ResepdetailBloc extends Bloc<ResepdetailEvent, ResepdetailState> {
  ResepdetailBloc() : super(ResepdetailInitial()) {
    on<FetchResepDetail>((event, emit) async {
      try {
        emit(ResepdetailLoading());
        ResepDetailModel reseps =
            await ResepServices().getResepDetail(event.key);
        emit(ResepdetailLoaded(reseps));
      } catch (e) {
        emit(ResepdetailFailed(e.toString()));
      }
    });
  }
}
