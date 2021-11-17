export 'app_route.gr.dart';

import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/home/home_page.dart';
import 'package:derasika2/ui/pages/score_detail/score_detail_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
      path: '/charts/:id',
      page: ScoreDetailPage,
      fullscreenDialog: true,
    ),
  ],
)
class $AppRouter {}
