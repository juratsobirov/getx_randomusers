import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/random_user_list_res.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  List<RandomUser> userList = [];
  ScrollController scrollController = ScrollController();
  int currentPage = 1;

  initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
          scrollController.offset) {
        currentPage ++;
        loadRandomUserList();
      }
    });
  }

  loadRandomUserList() async {
    isLoading = true;
    update();

    var response = await Network.GET(Network.API_RANDOM_USER_LIST,
        Network.paramsRandomUserList(currentPage));
    LogService.i(response!);
    var randomUserListRes = Network.parseRandomUserList(response);
    currentPage = randomUserListRes.info.page + 1;

    userList.addAll(randomUserListRes.results);
    isLoading = false;
    update();
  }
}
