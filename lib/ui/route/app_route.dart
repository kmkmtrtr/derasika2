export 'app_route.gr.dart';

import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/home/home_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
  ],
)
class $AppRouter {}
