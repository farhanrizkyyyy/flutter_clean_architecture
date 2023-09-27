// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/constants/pallete_constant.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/presentation/controllers/post_detail_controller.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/presentation/widgets/comment_tile.dart';
import 'package:get/get.dart';

class PostDetailView extends GetView<PostDetailController> {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppbar() => AppBar();

  Widget _buildBody() => Obx(
        () {
          if (controller.isLoading.value) {
            return _buildLoading();
          } else if (controller.isError.value) {
            return _buildReload();
          } else {
            return _buildPostDetail();
          }
        },
      );

  Widget _buildLoading() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildReload() => Center(
        child: ElevatedButton(
          onPressed: () => controller.getPostDetailById(controller.args['id']),
          child: Text('Reload'),
        ),
      );

  Widget _buildPostDetail() => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.postDetail.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Author: ${controller.postDetail.userId}',
              style: TextStyle(
                fontSize: 14,
                color: PalleteConstant.borderColor,
              ),
            ),
            SizedBox(height: 12),
            Text(controller.postDetail.body),
            Divider(
              height: 50,
              thickness: 2,
            ),
            _buildComments(),
          ],
        ),
      );

  Widget _buildComments() => ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (_, i) => CommentTile(comment: controller.comments[i]),
        separatorBuilder: (_, i) => SizedBox(height: 8),
        itemCount: controller.comments.length,
      );
}
