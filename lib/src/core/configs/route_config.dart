import 'package:flutter_clean_architecture/src/core/constants/route_name_constant.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/presentation/bindings/post_detail_binding.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/presentation/views/post_detail_view.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/presentation/bindings/post_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../feature/post_list/presentation/views/post_list_view.dart';

class RouteConfig {
  static List<GetPage> pages = <GetPage>[
    GetPage(
      name: RouteNameConstant.posts,
      page: () => const PostListView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: RouteNameConstant.postDetail,
      page: () => const PostDetailView(),
      binding: PostDetailBinding(),
    ),
  ];
}
