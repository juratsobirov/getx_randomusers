import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomusers_getx/controllers/home_controller.dart';

import '../models/random_user_list_res.dart';
import '../views/item_of_random_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.initScrollListener();
    _controller.loadRandomUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 232, 232, 1),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Random User - SetState"),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [
              ListView.builder(
                controller: _controller.scrollController,
                itemCount: _controller.userList.length,
                itemBuilder: (context, index) {
                  return itemOfRendomUser(_controller.userList[index], index);
                },
              ),
              _controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
