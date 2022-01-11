part of 'newresep_bloc.dart';

abstract class NewresepState {
  const NewresepState();
}

class NewresepInitial extends NewresepState {}

class NewResepLoading extends NewresepState {}

class NewResepFailed extends NewresepState {
  final String error;

  const NewResepFailed(this.error);
}

class NewResepLoaded extends NewresepState {
  final ResepListModel newreseplist;
  const NewResepLoaded(this.newreseplist);
}
