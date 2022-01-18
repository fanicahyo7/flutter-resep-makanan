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

  Future<ResepDetailModel> getResepDetail(String key) async {
    try {
      Response response = await _dio.get(baseURL + "/recipe/" + key);
      return ResepDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      return ResepDetailModel.fromJson(e.response?.data);
    }
  }

  Future<ResepListModel> getResepByKategori(String key) async {
    try {
      Response response = await _dio.get(baseURL + "/categorys/recipes/" + key);
      return ResepListModel.fromJson(response.data);
    } on DioError catch (e) {
      return ResepListModel.fromJson(e.response?.data);
    }
  }

  Future<ResepListModel> searchResep(String key) async {
    try {
      Response response = await _dio.get(baseURL + "/search/?q=" + key);
      return ResepListModel.fromJson(response.data);
    } on DioError catch (e) {
      return ResepListModel.fromJson(e.response?.data);
    }
  }
}
