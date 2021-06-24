import 'package:get/get.dart';
import 'package:spiro_study/apiz/api_routes.dart';
import 'package:spiro_study/model/search_model.dart';
import 'package:spiro_study/model/suggestion.dart';

class ApiServices extends GetConnect {
  ApiServices._();

  static final ApiServices _instance = ApiServices._();

  static ApiServices get instance => _instance;

  Future<List<SearchModel>> getCourses({String? query}) async {
    Response response =
        await get(ApiRoutes.searchUrl + '?q={$query}&type=videos');
    if (response.status.hasError) {
      return [];
    } else {
      List<dynamic> body = response.body;
      List<SearchModel> searchList =
          body.map((dynamic item) => SearchModel.fromJson(item)).toList();
      return searchList;
    }
  }

  Future<List<Suggestion>> getSuggestion({String? query}) async {
    Response response = await get(ApiRoutes.suggestionUrl + '?q=$query');
    if (response.status.hasError) {
      return throw Exception();
    } else {
      List<dynamic> body = response.body;
      List<Suggestion> suggestionList = body
          .map((dynamic item) => Suggestion.fromJson(item))
          .where((element) {
        return element.suggestions
            .toString()
            .toLowerCase()
            .contains(query.toString().toLowerCase());
      }).toList();
      return suggestionList;
    }
  }
}
