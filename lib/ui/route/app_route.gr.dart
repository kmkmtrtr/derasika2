// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:derasika2/data/model/enum/play_mode.dart' as _i14;
import 'package:derasika2/ui/pages/daily_play_log/daily_play_log_page.dart'
    as _i5;
import 'package:derasika2/ui/pages/daily_play_log/play_detail_page.dart'
    as _i11;
import 'package:derasika2/ui/pages/daily_play_log/play_summary_page.dart'
    as _i10;
import 'package:derasika2/ui/pages/home/home_page.dart' as _i1;
import 'package:derasika2/ui/pages/play_log/play_log_page.dart' as _i4;
import 'package:derasika2/ui/pages/score_detail/children/chart_page.dart'
    as _i7;
import 'package:derasika2/ui/pages/score_detail/children/info_page.dart' as _i9;
import 'package:derasika2/ui/pages/score_detail/children/memo_page.dart' as _i8;
import 'package:derasika2/ui/pages/score_detail/children/score_page.dart'
    as _i6;
import 'package:derasika2/ui/pages/score_detail/score_detail_page.dart' as _i2;
import 'package:derasika2/ui/pages/webview/csv_import_webview.dart' as _i3;
import 'package:flutter/material.dart' as _i13;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.HomePage(key: args.key));
    },
    ScoreDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ScoreDetailRouteArgs>(
          orElse: () => ScoreDetailRouteArgs(chartId: pathParams.getInt('id')));
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ScoreDetailPage(key: args.key, chartId: args.chartId),
          fullscreenDialog: true);
    },
    CsvImportWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CsvImportWebViewRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.CsvImportWebViewPage(
              key: args.key,
              playMode: args.playMode,
              versionId: args.versionId),
          fullscreenDialog: true);
    },
    PlayLogRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.PlayLogPage());
    },
    DailyPlayLogRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<DailyPlayLogRouteArgs>(
          orElse: () =>
              DailyPlayLogRouteArgs(dateString: pathParams.getString('date')));
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i5.DailyPlayLogPage(key: args.key, dateString: args.dateString),
          fullscreenDialog: true);
    },
    ScoreRoute.name: (routeData) {
      final args = routeData.argsAs<ScoreRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.ScorePage(key: args.key, chartId: args.chartId));
    },
    ChartRoute.name: (routeData) {
      final args = routeData.argsAs<ChartRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.ChartPage(key: args.key, chartId: args.chartId));
    },
    MemoRoute.name: (routeData) {
      final args = routeData.argsAs<MemoRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.MemoPage(key: args.key, chartId: args.chartId));
    },
    InfoRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i9.InfoPage(key: args.key, chartId: args.chartId));
    },
    PlaySummaryRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<PlaySummaryRouteArgs>(
          orElse: () =>
              PlaySummaryRouteArgs(dateString: pathParams.getString('date')));
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i10.PlaySummaryPage(key: args.key, dateString: args.dateString));
    },
    PlayDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<PlayDetailRouteArgs>(
          orElse: () =>
              PlayDetailRouteArgs(dateString: pathParams.getString('date')));
      return _i12.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i11.PlayDetailPage(key: args.key, dateString: args.dateString));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(HomeRoute.name, path: '/'),
        _i12.RouteConfig(ScoreDetailRoute.name, path: '/detail/:id', children: [
          _i12.RouteConfig(ScoreRoute.name,
              path: 'summary', parent: ScoreDetailRoute.name),
          _i12.RouteConfig(ChartRoute.name,
              path: 'chart', parent: ScoreDetailRoute.name),
          _i12.RouteConfig(MemoRoute.name,
              path: 'memo', parent: ScoreDetailRoute.name),
          _i12.RouteConfig(InfoRoute.name,
              path: 'info', parent: ScoreDetailRoute.name),
          _i12.RouteConfig('*#redirect',
              path: '*',
              parent: ScoreDetailRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i12.RouteConfig(CsvImportWebViewRoute.name, path: '/csvImportWebView'),
        _i12.RouteConfig(PlayLogRoute.name, path: '/playLogs'),
        _i12.RouteConfig(DailyPlayLogRoute.name,
            path: '/playLogs/:date',
            children: [
              _i12.RouteConfig(PlaySummaryRoute.name,
                  path: 'summary', parent: DailyPlayLogRoute.name),
              _i12.RouteConfig(PlayDetailRoute.name,
                  path: 'chart', parent: DailyPlayLogRoute.name),
              _i12.RouteConfig('*#redirect',
                  path: '*',
                  parent: DailyPlayLogRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ])
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i13.Key? key})
      : super(name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i13.Key? key;
}

/// generated route for [_i2.ScoreDetailPage]
class ScoreDetailRoute extends _i12.PageRouteInfo<ScoreDetailRouteArgs> {
  ScoreDetailRoute(
      {_i13.Key? key, required int chartId, List<_i12.PageRouteInfo>? children})
      : super(name,
            path: '/detail/:id',
            args: ScoreDetailRouteArgs(key: key, chartId: chartId),
            rawPathParams: {'id': chartId},
            initialChildren: children);

  static const String name = 'ScoreDetailRoute';
}

class ScoreDetailRouteArgs {
  const ScoreDetailRouteArgs({this.key, required this.chartId});

  final _i13.Key? key;

  final int chartId;
}

/// generated route for [_i3.CsvImportWebViewPage]
class CsvImportWebViewRoute
    extends _i12.PageRouteInfo<CsvImportWebViewRouteArgs> {
  CsvImportWebViewRoute(
      {_i13.Key? key, required _i14.PlayMode playMode, required int versionId})
      : super(name,
            path: '/csvImportWebView',
            args: CsvImportWebViewRouteArgs(
                key: key, playMode: playMode, versionId: versionId));

  static const String name = 'CsvImportWebViewRoute';
}

class CsvImportWebViewRouteArgs {
  const CsvImportWebViewRouteArgs(
      {this.key, required this.playMode, required this.versionId});

  final _i13.Key? key;

  final _i14.PlayMode playMode;

  final int versionId;
}

/// generated route for [_i4.PlayLogPage]
class PlayLogRoute extends _i12.PageRouteInfo<void> {
  const PlayLogRoute() : super(name, path: '/playLogs');

  static const String name = 'PlayLogRoute';
}

/// generated route for [_i5.DailyPlayLogPage]
class DailyPlayLogRoute extends _i12.PageRouteInfo<DailyPlayLogRouteArgs> {
  DailyPlayLogRoute(
      {_i13.Key? key,
      required String dateString,
      List<_i12.PageRouteInfo>? children})
      : super(name,
            path: '/playLogs/:date',
            args: DailyPlayLogRouteArgs(key: key, dateString: dateString),
            rawPathParams: {'date': dateString},
            initialChildren: children);

  static const String name = 'DailyPlayLogRoute';
}

class DailyPlayLogRouteArgs {
  const DailyPlayLogRouteArgs({this.key, required this.dateString});

  final _i13.Key? key;

  final String dateString;
}

/// generated route for [_i6.ScorePage]
class ScoreRoute extends _i12.PageRouteInfo<ScoreRouteArgs> {
  ScoreRoute({_i13.Key? key, required int chartId})
      : super(name,
            path: 'summary', args: ScoreRouteArgs(key: key, chartId: chartId));

  static const String name = 'ScoreRoute';
}

class ScoreRouteArgs {
  const ScoreRouteArgs({this.key, required this.chartId});

  final _i13.Key? key;

  final int chartId;
}

/// generated route for [_i7.ChartPage]
class ChartRoute extends _i12.PageRouteInfo<ChartRouteArgs> {
  ChartRoute({_i13.Key? key, required int chartId})
      : super(name,
            path: 'chart', args: ChartRouteArgs(key: key, chartId: chartId));

  static const String name = 'ChartRoute';
}

class ChartRouteArgs {
  const ChartRouteArgs({this.key, required this.chartId});

  final _i13.Key? key;

  final int chartId;
}

/// generated route for [_i8.MemoPage]
class MemoRoute extends _i12.PageRouteInfo<MemoRouteArgs> {
  MemoRoute({_i13.Key? key, required int chartId})
      : super(name,
            path: 'memo', args: MemoRouteArgs(key: key, chartId: chartId));

  static const String name = 'MemoRoute';
}

class MemoRouteArgs {
  const MemoRouteArgs({this.key, required this.chartId});

  final _i13.Key? key;

  final int chartId;
}

/// generated route for [_i9.InfoPage]
class InfoRoute extends _i12.PageRouteInfo<InfoRouteArgs> {
  InfoRoute({_i13.Key? key, required int chartId})
      : super(name,
            path: 'info', args: InfoRouteArgs(key: key, chartId: chartId));

  static const String name = 'InfoRoute';
}

class InfoRouteArgs {
  const InfoRouteArgs({this.key, required this.chartId});

  final _i13.Key? key;

  final int chartId;
}

/// generated route for [_i10.PlaySummaryPage]
class PlaySummaryRoute extends _i12.PageRouteInfo<PlaySummaryRouteArgs> {
  PlaySummaryRoute({_i13.Key? key, required String dateString})
      : super(name,
            path: 'summary',
            args: PlaySummaryRouteArgs(key: key, dateString: dateString));

  static const String name = 'PlaySummaryRoute';
}

class PlaySummaryRouteArgs {
  const PlaySummaryRouteArgs({this.key, required this.dateString});

  final _i13.Key? key;

  final String dateString;
}

/// generated route for [_i11.PlayDetailPage]
class PlayDetailRoute extends _i12.PageRouteInfo<PlayDetailRouteArgs> {
  PlayDetailRoute({_i13.Key? key, required String dateString})
      : super(name,
            path: 'chart',
            args: PlayDetailRouteArgs(key: key, dateString: dateString));

  static const String name = 'PlayDetailRoute';
}

class PlayDetailRouteArgs {
  const PlayDetailRouteArgs({this.key, required this.dateString});

  final _i13.Key? key;

  final String dateString;
}
