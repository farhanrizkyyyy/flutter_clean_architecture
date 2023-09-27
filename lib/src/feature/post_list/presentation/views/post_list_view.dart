// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/constants/route_name_constant.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/presentation/controllers/post_controller.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/presentation/widgets/post_tile.dart';
import 'package:get/get.dart';

class PostListView extends GetView<PostController> {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppbar() => AppBar(
        title: Text('Flutter Clean Architecture Example'),
      );

  Widget _buildBody() => Obx(
        () {
          if (controller.isLoading.value) {
            return _buildLoading();
          } else if (controller.isError.value) {
            return _buildReload();
          } else {
            return _buildPostList();
          }
        },
      );

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildReload() {
    return Center(
      child: ElevatedButton(
        onPressed: () => controller.getPosts(),
        child: Text('Reload'),
      ),
    );
  }

  Widget _buildPostList() {
    return RefreshIndicator(
      onRefresh: () async => controller.getPosts(),
      child: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => PostTile(
          post: controller.posts[i],
          onTap: () => Get.toNamed(
            RouteNameConstant.postDetail,
            arguments: {
              'id': controller.posts[i].id,
            },
          ),
        ),
        separatorBuilder: (_, i) => SizedBox(height: 16),
        itemCount: controller.posts.length,
      ),
    );
  }
}
