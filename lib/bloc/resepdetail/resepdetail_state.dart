part of 'resepdetail_bloc.dart';

@immutable
abstract class ResepdetailState {
  const ResepdetailState();
}

class ResepdetailInitial extends ResepdetailState {}

class ResepdetailLoading extends ResepdetailState {}

class ResepdetailFailed extends ResepdetailState {
  final String error;

  const ResepdetailFailed(this.error);
}

class ResepdetailLoaded extends ResepdetailState {
  final ResepDetailModel resep;

  const ResepdetailLoaded(this.resep);
}
