part of 'services.dart';

class ResepServices {
  final Dio _dio = Dio();

  Future<ResepListModel> getNewReseps() async {
    try {
      Response response = await _dio.get(baseURL + "/recipes");
      return ResepListModel.fromJson(response.data);
    } on DioError catch (e) {
      return ResepListModel.fromJson(e.response?.data);
    }
  }
}
