export 'app_route.gr.dart';

import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/home/home_page.dart';
import 'package:derasika2/ui/pages/play_log/play_log_page.dart';
import 'package:derasika2/ui/pages/score_detail/children/chart_page.dart';
import 'package:derasika2/ui/pages/score_detail/children/info_page.dart';
import 'package:derasika2/ui/pages/score_detail/children/memo_page.dart';
import 'package:derasika2/ui/pages/score_detail/children/score_page.dart';
import 'package:derasika2/ui/pages/score_detail/score_detail_page.dart';
import 'package:derasika2/ui/pages/webview/csv_import_webview.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
        path: '/detail/:id',
        page: ScoreDetailPage,
        fullscreenDialog: true,
        children: [
          AutoRoute(path: 'summary', page: ScorePage),
          AutoRoute(path: 'chart', page: ChartPage),
          AutoRoute(path: 'memo', page: MemoPage),
          AutoRoute(path: 'info', page: InfoPage),
          RedirectRoute(path: '*', redirectTo: ''),
        ]),
    AutoRoute(
      path: '/csvImportWebView',
      page: CsvImportWebViewPage,
      fullscreenDialog: true,
    ),
    AutoRoute(
      path: '/playLogs',
      page: PlayLogPage,
    ),
  ],
)
class $AppRouter {}
