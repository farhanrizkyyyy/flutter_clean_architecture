// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/constants/pallete_constant.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/entities/post_entity.dart';

class PostTile extends StatelessWidget {
  final PostEntity post;

  PostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PalleteConstant.white,
        border: Border.all(
          color: PalleteConstant.borderColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Author: ${post.userId}',
            style: TextStyle(
              fontSize: 12,
              color: PalleteConstant.borderColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            post.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
