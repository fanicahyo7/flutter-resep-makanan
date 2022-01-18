part of 'searchresep_bloc.dart';

@immutable
abstract class SearchresepState {}

class SearchresepInitial extends SearchresepState {}

class SearchresepLoading extends SearchresepState {}

class SearchresepFailed extends SearchresepState {
  final String error;

  SearchresepFailed(this.error);
}

class SearchresepLoaded extends SearchresepState {
  final ResepListModel resep;

  SearchresepLoaded(this.resep);
}
