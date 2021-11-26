// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:derasika2/data/model/play_mode.dart' as _i10;
import 'package:derasika2/ui/pages/home/home_page.dart' as _i1;
import 'package:derasika2/ui/pages/score_detail/children/chart_page.dart'
    as _i5;
import 'package:derasika2/ui/pages/score_detail/children/info_page.dart' as _i7;
import 'package:derasika2/ui/pages/score_detail/children/memo_page.dart' as _i6;
import 'package:derasika2/ui/pages/score_detail/children/score_page.dart'
    as _i4;
import 'package:derasika2/ui/pages/score_detail/score_detail_page.dart' as _i2;
import 'package:derasika2/ui/pages/webview/csv_import_webview.dart' as _i3;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.HomePage(key: args.key));
    },
    ScoreDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ScoreDetailRouteArgs>(
          orElse: () => ScoreDetailRouteArgs(chartId: pathParams.getInt('id')));
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ScoreDetailPage(key: args.key, chartId: args.chartId),
          fullscreenDialog: true);
    },
    CsvImportWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CsvImportWebViewRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.CsvImportWebViewPage(
              key: args.key,
              playMode: args.playMode,
              versionId: args.versionId),
          fullscreenDialog: true);
    },
    ScoreRoute.name: (routeData) {
      final args = routeData.argsAs<ScoreRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.ScorePage(key: args.key, chartId: args.chartId));
    },
    ChartRoute.name: (routeData) {
      final args = routeData.argsAs<ChartRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.ChartPage(key: args.key, chartId: args.chartId));
    },
    MemoRoute.name: (routeData) {
      final args = routeData.argsAs<MemoRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.MemoPage(key: args.key, chartId: args.chartId));
    },
    InfoRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.InfoPage(key: args.key, chartId: args.chartId));
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(HomeRoute.name, path: '/'),
        _i8.RouteConfig(ScoreDetailRoute.name, path: '/detail/:id', children: [
          _i8.RouteConfig(ScoreRoute.name,
              path: 'summary', parent: ScoreDetailRoute.name),
          _i8.RouteConfig(ChartRoute.name,
              path: 'chart', parent: ScoreDetailRoute.name),
          _i8.RouteConfig(MemoRoute.name,
              path: 'memo', parent: ScoreDetailRoute.name),
          _i8.RouteConfig(InfoRoute.name,
              path: 'info', parent: ScoreDetailRoute.name),
          _i8.RouteConfig('*#redirect',
              path: '*',
              parent: ScoreDetailRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i8.RouteConfig(CsvImportWebViewRoute.name, path: '/csvImportWebView')
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i9.Key? key})
      : super(name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i9.Key? key;
}

/// generated route for [_i2.ScoreDetailPage]
class ScoreDetailRoute extends _i8.PageRouteInfo<ScoreDetailRouteArgs> {
  ScoreDetailRoute(
      {_i9.Key? key, required int chartId, List<_i8.PageRouteInfo>? children})
      : super(name,
            path: '/detail/:id',
            args: ScoreDetailRouteArgs(key: key, chartId: chartId),
            rawPathParams: {'id': chartId},
            initialChildren: children);

  static const String name = 'ScoreDetailRoute';
}

class ScoreDetailRouteArgs {
  const ScoreDetailRouteArgs({this.key, required this.chartId});

  final _i9.Key? key;

  final int chartId;
}

/// generated route for [_i3.CsvImportWebViewPage]
class CsvImportWebViewRoute
    extends _i8.PageRouteInfo<CsvImportWebViewRouteArgs> {
  CsvImportWebViewRoute(
      {_i9.Key? key, required _i10.PlayMode playMode, required int versionId})
      : super(name,
            path: '/csvImportWebView',
            args: CsvImportWebViewRouteArgs(
                key: key, playMode: playMode, versionId: versionId));

  static const String name = 'CsvImportWebViewRoute';
}

class CsvImportWebViewRouteArgs {
  const CsvImportWebViewRouteArgs(
      {this.key, required this.playMode, required this.versionId});

  final _i9.Key? key;

  final _i10.PlayMode playMode;

  final int versionId;
}

/// generated route for [_i4.ScorePage]
class ScoreRoute extends _i8.PageRouteInfo<ScoreRouteArgs> {
  ScoreRoute({_i9.Key? key, required int chartId})
      : super(name,
            path: 'summary', args: ScoreRouteArgs(key: key, chartId: chartId));

  static const String name = 'ScoreRoute';
}

class ScoreRouteArgs {
  const ScoreRouteArgs({this.key, required this.chartId});

  final _i9.Key? key;

  final int chartId;
}

/// generated route for [_i5.ChartPage]
class ChartRoute extends _i8.PageRouteInfo<ChartRouteArgs> {
  ChartRoute({_i9.Key? key, required int chartId})
      : super(name,
            path: 'chart', args: ChartRouteArgs(key: key, chartId: chartId));

  static const String name = 'ChartRoute';
}

class ChartRouteArgs {
  const ChartRouteArgs({this.key, required this.chartId});

  final _i9.Key? key;

  final int chartId;
}

/// generated route for [_i6.MemoPage]
class MemoRoute extends _i8.PageRouteInfo<MemoRouteArgs> {
  MemoRoute({_i9.Key? key, required int chartId})
      : super(name,
            path: 'memo', args: MemoRouteArgs(key: key, chartId: chartId));

  static const String name = 'MemoRoute';
}

class MemoRouteArgs {
  const MemoRouteArgs({this.key, required this.chartId});

  final _i9.Key? key;

  final int chartId;
}

/// generated route for [_i7.InfoPage]
class InfoRoute extends _i8.PageRouteInfo<InfoRouteArgs> {
  InfoRoute({_i9.Key? key, required int chartId})
      : super(name,
            path: 'info', args: InfoRouteArgs(key: key, chartId: chartId));

  static const String name = 'InfoRoute';
}

class InfoRouteArgs {
  const InfoRouteArgs({this.key, required this.chartId});

  final _i9.Key? key;

  final int chartId;
}
