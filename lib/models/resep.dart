class ResepListModel {
  String? method;
  bool? status;
  List<Resep>? results;

  ResepListModel({this.method, this.status, this.results});

  ResepListModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      results = <Resep>[];
      json['results'].forEach((v) {
        results!.add(Resep.fromJson(v));
      });
    }
  }
}

class Resep {
  final String key;
  final String title;
  final String thumb;
  final String times;
  String? dificulty;

  Resep(
      {required this.key,
      required this.title,
      required this.thumb,
      required this.times,
      this.dificulty});

  factory Resep.fromJson(Map<String, dynamic> data) => Resep(
      key: data['key'],
      title: data['title'],
      thumb: data['thumb'],
      times: data['times'],
      dificulty: data['difficulty'] ?? 'Mudah');
}
