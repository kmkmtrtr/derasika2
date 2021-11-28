// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:derasika2/data/model/enum/play_mode.dart' as _i11;
import 'package:derasika2/ui/pages/home/home_page.dart' as _i1;
import 'package:derasika2/ui/pages/play_log/play_log_page.dart' as _i4;
import 'package:derasika2/ui/pages/score_detail/children/chart_page.dart'
    as _i6;
import 'package:derasika2/ui/pages/score_detail/children/info_page.dart' as _i8;
import 'package:derasika2/ui/pages/score_detail/children/memo_page.dart' as _i7;
import 'package:derasika2/ui/pages/score_detail/children/score_page.dart'
    as _i5;
import 'package:derasika2/ui/pages/score_detail/score_detail_page.dart' as _i2;
import 'package:derasika2/ui/pages/webview/csv_import_webview.dart' as _i3;
import 'package:flutter/material.dart' as _i10;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.HomePage(key: args.key));
    },
    ScoreDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ScoreDetailRouteArgs>(
          orElse: () => ScoreDetailRouteArgs(chartId: pathParams.getInt('id')));
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ScoreDetailPage(key: args.key, chartId: args.chartId),
          fullscreenDialog: true);
    },
    CsvImportWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CsvImportWebViewRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.CsvImportWebViewPage(
              key: args.key,
              playMode: args.playMode,
              versionId: args.versionId),
          fullscreenDialog: true);
    },
    PlayLogRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.PlayLogPage());
    },
    ScoreRoute.name: (routeData) {
      final args = routeData.argsAs<ScoreRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.ScorePage(key: args.key, chartId: args.chartId));
    },
    ChartRoute.name: (routeData) {
      final args = routeData.argsAs<ChartRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.ChartPage(key: args.key, chartId: args.chartId));
    },
    MemoRoute.name: (routeData) {
      final args = routeData.argsAs<MemoRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.MemoPage(key: args.key, chartId: args.chartId));
    },
    InfoRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.InfoPage(key: args.key, chartId: args.chartId));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(HomeRoute.name, path: '/'),
        _i9.RouteConfig(ScoreDetailRoute.name, path: '/detail/:id', children: [
          _i9.RouteConfig(ScoreRoute.name,
              path: 'summary', parent: ScoreDetailRoute.name),
          _i9.RouteConfig(ChartRoute.name,
              path: 'chart', parent: ScoreDetailRoute.name),
          _i9.RouteConfig(MemoRoute.name,
              path: 'memo', parent: ScoreDetailRoute.name),
          _i9.RouteConfig(InfoRoute.name,
              path: 'info', parent: ScoreDetailRoute.name),
          _i9.RouteConfig('*#redirect',
              path: '*',
              parent: ScoreDetailRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i9.RouteConfig(CsvImportWebViewRoute.name, path: '/csvImportWebView'),
        _i9.RouteConfig(PlayLogRoute.name, path: '/playLogs')
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i10.Key? key})
      : super(name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i10.Key? key;
}

/// generated route for [_i2.ScoreDetailPage]
class ScoreDetailRoute extends _i9.PageRouteInfo<ScoreDetailRouteArgs> {
  ScoreDetailRoute(
      {_i10.Key? key, required int chartId, List<_i9.PageRouteInfo>? children})
      : super(name,
            path: '/detail/:id',
            args: ScoreDetailRouteArgs(key: key, chartId: chartId),
            rawPathParams: {'id': chartId},
            initialChildren: children);

  static const String name = 'ScoreDetailRoute';
}

class ScoreDetailRouteArgs {
  const ScoreDetailRouteArgs({this.key, required this.chartId});

  final _i10.Key? key;

  final int chartId;
}

/// generated route for [_i3.CsvImportWebViewPage]
class CsvImportWebViewRoute
    extends _i9.PageRouteInfo<CsvImportWebViewRouteArgs> {
  CsvImportWebViewRoute(
      {_i10.Key? key, required _i11.PlayMode playMode, required int versionId})
      : super(name,
            path: '/csvImportWebView',
            args: CsvImportWebViewRouteArgs(
                key: key, playMode: playMode, versionId: versionId));

  static const String name = 'CsvImportWebViewRoute';
}

class CsvImportWebViewRouteArgs {
  const CsvImportWebViewRouteArgs(
      {this.key, required this.playMode, required this.versionId});

  final _i10.Key? key;

  final _i11.PlayMode playMode;

  final int versionId;
}

/// generated route for [_i4.PlayLogPage]
class PlayLogRoute extends _i9.PageRouteInfo<void> {
  const PlayLogRoute() : super(name, path: '/playLogs');

  static const String name = 'PlayLogRoute';
}

/// generated route for [_i5.ScorePage]
class ScoreRoute extends _i9.PageRouteInfo<ScoreRouteArgs> {
  ScoreRoute({_i10.Key? key, required int chartId})
      : super(name,
            path: 'summary', args: ScoreRouteArgs(key: key, chartId: chartId));

  static const String name = 'ScoreRoute';
}

class ScoreRouteArgs {
  const ScoreRouteArgs({this.key, required this.chartId});

  final _i10.Key? key;

  final int chartId;
}

/// generated route for [_i6.ChartPage]
class ChartRoute extends _i9.PageRouteInfo<ChartRouteArgs> {
  ChartRoute({_i10.Key? key, required int chartId})
      : super(name,
            path: 'chart', args: ChartRouteArgs(key: key, chartId: chartId));

  static const String name = 'ChartRoute';
}

class ChartRouteArgs {
  const ChartRouteArgs({this.key, required this.chartId});

  final _i10.Key? key;

  final int chartId;
}

/// generated route for [_i7.MemoPage]
class MemoRoute extends _i9.PageRouteInfo<MemoRouteArgs> {
  MemoRoute({_i10.Key? key, required int chartId})
      : super(name,
            path: 'memo', args: MemoRouteArgs(key: key, chartId: chartId));

  static const String name = 'MemoRoute';
}

class MemoRouteArgs {
  const MemoRouteArgs({this.key, required this.chartId});

  final _i10.Key? key;

  final int chartId;
}

/// generated route for [_i8.InfoPage]
class InfoRoute extends _i9.PageRouteInfo<InfoRouteArgs> {
  InfoRoute({_i10.Key? key, required int chartId})
      : super(name,
            path: 'info', args: InfoRouteArgs(key: key, chartId: chartId));

  static const String name = 'InfoRoute';
}

class InfoRouteArgs {
  const InfoRouteArgs({this.key, required this.chartId});

  final _i10.Key? key;

  final int chartId;
}
