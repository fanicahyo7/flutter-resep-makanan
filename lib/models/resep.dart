import 'package:equatable/equatable.dart';

class Resep extends Equatable {
  final String key;
  final String title;
  final String thumb;
  final String times;
  final String portion;
  final String difficult;

  const Resep(
      {required this.key,
      required this.title,
      required this.thumb,
      required this.times,
      required this.portion,
      required this.difficult});

  factory Resep.fromJson(Map<String, dynamic> data) => Resep(
      key: data['key'],
      title: data['title'],
      thumb: data['thumb'],
      times: data['times'],
      portion: data['portion'],
      difficult: data['difficult']);

  Map<String, dynamic> toJson() => {
        'key': key,
        'title': title,
        'thumb': thumb,
        'times': times,
        'portion': portion,
        'difficult': difficult
      };

  @override
  List<Object?> get props => [key, title, thumb, times, portion, difficult];
}
