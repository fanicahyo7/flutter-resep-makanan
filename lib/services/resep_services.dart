part of 'services.dart';

class ResepServices {
  final Dio _dio = Dio();

  Future<ResepListModel> getReseps() async {
    try {
      Response response = await _dio.get(baseURL + "/recipes");
      return ResepListModel.fromJson(response.data);
    } on DioError catch (e) {
      return ResepListModel.fromJson(e.response?.data);
    }
  }

  Future<ResepListModel> getNewReseplimit() async {
    try {
      Response response = await _dio.get(baseURL + "/recipes-length/?limit=5");
      return ResepListModel.fromJson(response.data);
    } on DioError catch (e) {
      return ResepListModel.fromJson(e.response?.data);
    }
  }

  Future<ResepCategoryModel> getCategoryResep() async {
    try {
      Response response = await _dio.get(baseURL + "/categorys/recipes");
      return ResepCategoryModel.fromJson(response.data);
    } on DioError catch (e) {
      return ResepCategoryModel.fromJson(e.response?.data);
    }
  }
}
