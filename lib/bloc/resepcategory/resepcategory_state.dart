part of 'resepcategory_bloc.dart';

abstract class ResepcategoryState {
  const ResepcategoryState();
}

class ResepcategoryInitial extends ResepcategoryState {}

class ResepcategoryLoading extends ResepcategoryState {}

class ResepcategoryFailed extends ResepcategoryState {
  final String error;
  ResepcategoryFailed(this.error);
}

class ResepcategoryLoaded extends ResepcategoryState {
  final ResepCategoryModel list;
  const ResepcategoryLoaded(this.list);
}

class ResepcategoryListInitial extends ResepcategoryState {}

class ResepcategoryListLoading extends ResepcategoryState {}

class ResepcategoryListFailed extends ResepcategoryState {
  final String error;
  ResepcategoryListFailed(this.error);
}

class ResepcategoryListLoaded extends ResepcategoryState {
  final ResepListModel list;
  const ResepcategoryListLoaded(this.list);
}
