import 'package:get/get.dart';
import 'package:spiro_study/apiz/api_services.dart';

class SearchController extends GetxController {
  var isSearching = false.obs;

  var searchResult = [].obs;

  var suggestionList = [].obs;

  void getSearchResult({String? query}) {
    searchResult.clear();
    ApiServices.instance.getCourses(query: query).then((value) {
      searchResult.addAll(value);
      isSearching.value = false;
    });
  }

  getSuggestions(String suggestionQuery) {
    suggestionList.clear();
    ApiServices.instance.getSuggestion(query: suggestionQuery).then((value) {
      suggestionList.addAll(value);
      isSearching.value = false;
    });
  }
}
