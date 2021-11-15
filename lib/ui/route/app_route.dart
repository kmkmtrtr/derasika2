export 'app_route.gr.dart';

import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/home/home_page.dart';
import 'package:derasika2/ui/pages/webview/csv_import_webview.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
      path: '/csvImportWebView',
      page: CsvImportWebViewPage,
      fullscreenDialog: true,
    ),
  ],
)
class $AppRouter {}
