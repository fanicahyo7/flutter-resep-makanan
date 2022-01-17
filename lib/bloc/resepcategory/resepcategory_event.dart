part of 'resepcategory_bloc.dart';

@immutable
abstract class ResepcategoryEvent {}

class FetchCategory extends ResepcategoryEvent {}

class FetchResepByCategory extends ResepcategoryEvent {
  final String key;

  FetchResepByCategory(this.key);
}
