part of 'resep_bloc.dart';

abstract class ResepState  {
  const ResepState();

}

class ResepInitial extends ResepState {

}

class ResepLoading extends ResepState {}

class ResepFailed extends ResepState {
  final String error;

  const ResepFailed(this.error);
}

class ResepLoaded extends ResepState {
  final ResepListModel reseplist;
  const ResepLoaded(this.reseplist);
}
