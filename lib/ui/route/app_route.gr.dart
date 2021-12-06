// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:derasika2/data/model/enum/play_mode.dart' as _i16;
import 'package:derasika2/ui/pages/daily_play_log/daily_play_log_page.dart'
    as _i6;
import 'package:derasika2/ui/pages/daily_play_log/play_detail_page.dart'
    as _i13;
import 'package:derasika2/ui/pages/daily_play_log/play_summary_page.dart'
    as _i12;
import 'package:derasika2/ui/pages/home/home_page.dart' as _i1;
import 'package:derasika2/ui/pages/play_log/play_log_page.dart' as _i4;
import 'package:derasika2/ui/pages/score_detail/children/chart_page.dart'
    as _i8;
import 'package:derasika2/ui/pages/score_detail/children/info_page.dart'
    as _i10;
import 'package:derasika2/ui/pages/score_detail/children/memo_page.dart' as _i9;
import 'package:derasika2/ui/pages/score_detail/children/score_page.dart'
    as _i7;
import 'package:derasika2/ui/pages/score_detail/score_detail_page.dart' as _i2;
import 'package:derasika2/ui/pages/sp12_tier/sp12_tier_list_page.dart' as _i11;
import 'package:derasika2/ui/pages/sp12_tier/sp12_tier_page.dart' as _i5;
import 'package:derasika2/ui/pages/webview/csv_import_webview.dart' as _i3;
import 'package:flutter/material.dart' as _i15;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ScoreDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ScoreDetailRouteArgs>(
          orElse: () => ScoreDetailRouteArgs(chartId: pathParams.getInt('id')));
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ScoreDetailPage(key: args.key, chartId: args.chartId),
          fullscreenDialog: true);
    },
    CsvImportWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CsvImportWebViewRouteArgs>();
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.CsvImportWebViewPage(
              key: args.key,
              playMode: args.playMode,
              versionId: args.versionId),
          fullscreenDialog: true);
    },
    PlayLogRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.PlayLogPage());
    },
    Sp12TierRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.Sp12TierPage());
    },
    DailyPlayLogRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<DailyPlayLogRouteArgs>(
          orElse: () =>
              DailyPlayLogRouteArgs(dateString: pathParams.getString('date')));
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i6.DailyPlayLogPage(key: args.key, dateString: args.dateString),
          fullscreenDialog: true);
    },
    ScoreRoute.name: (routeData) {
      final args = routeData.argsAs<ScoreRouteArgs>();
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.ScorePage(key: args.key, chartId: args.chartId));
    },
    ChartRoute.name: (routeData) {
      final args = routeData.argsAs<ChartRouteArgs>();
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.ChartPage(key: args.key, chartId: args.chartId));
    },
    MemoRoute.name: (routeData) {
      final args = routeData.argsAs<MemoRouteArgs>();
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i9.MemoPage(key: args.key, chartId: args.chartId));
    },
    InfoRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRouteArgs>();
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.InfoPage(key: args.key, chartId: args.chartId));
    },
    Sp12TierListRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<Sp12TierListRouteArgs>(
          orElse: () =>
              Sp12TierListRouteArgs(mode: pathParams.getString('mode')));
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.Sp12TierListPage(key: args.key, mode: args.mode));
    },
    PlaySummaryRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<PlaySummaryRouteArgs>(
          orElse: () =>
              PlaySummaryRouteArgs(dateString: pathParams.getString('date')));
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i12.PlaySummaryPage(key: args.key, dateString: args.dateString));
    },
    PlayDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<PlayDetailRouteArgs>(
          orElse: () =>
              PlayDetailRouteArgs(dateString: pathParams.getString('date')));
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i13.PlayDetailPage(key: args.key, dateString: args.dateString));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(HomeRoute.name, path: '/'),
        _i14.RouteConfig(ScoreDetailRoute.name, path: '/detail/:id', children: [
          _i14.RouteConfig(ScoreRoute.name,
              path: 'summary', parent: ScoreDetailRoute.name),
          _i14.RouteConfig(ChartRoute.name,
              path: 'chart', parent: ScoreDetailRoute.name),
          _i14.RouteConfig(MemoRoute.name,
              path: 'memo', parent: ScoreDetailRoute.name),
          _i14.RouteConfig(InfoRoute.name,
              path: 'info', parent: ScoreDetailRoute.name),
          _i14.RouteConfig('*#redirect',
              path: '*',
              parent: ScoreDetailRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i14.RouteConfig(CsvImportWebViewRoute.name, path: '/csvImportWebView'),
        _i14.RouteConfig(PlayLogRoute.name, path: '/playLogs'),
        _i14.RouteConfig(Sp12TierRoute.name, path: '/sp12Tier', children: [
          _i14.RouteConfig(Sp12TierListRoute.name,
              path: ':mode', parent: Sp12TierRoute.name)
        ]),
        _i14.RouteConfig(DailyPlayLogRoute.name,
            path: '/playLogs/:date',
            children: [
              _i14.RouteConfig(PlaySummaryRoute.name,
                  path: 'summary', parent: DailyPlayLogRoute.name),
              _i14.RouteConfig(PlayDetailRoute.name,
                  path: 'chart', parent: DailyPlayLogRoute.name),
              _i14.RouteConfig('*#redirect',
                  path: '*',
                  parent: DailyPlayLogRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ])
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for [_i2.ScoreDetailPage]
class ScoreDetailRoute extends _i14.PageRouteInfo<ScoreDetailRouteArgs> {
  ScoreDetailRoute(
      {_i15.Key? key, required int chartId, List<_i14.PageRouteInfo>? children})
      : super(name,
            path: '/detail/:id',
            args: ScoreDetailRouteArgs(key: key, chartId: chartId),
            rawPathParams: {'id': chartId},
            initialChildren: children);

  static const String name = 'ScoreDetailRoute';
}

class ScoreDetailRouteArgs {
  const ScoreDetailRouteArgs({this.key, required this.chartId});

  final _i15.Key? key;

  final int chartId;
}

/// generated route for [_i3.CsvImportWebViewPage]
class CsvImportWebViewRoute
    extends _i14.PageRouteInfo<CsvImportWebViewRouteArgs> {
  CsvImportWebViewRoute(
      {_i15.Key? key, required _i16.PlayMode playMode, required int versionId})
      : super(name,
            path: '/csvImportWebView',
            args: CsvImportWebViewRouteArgs(
                key: key, playMode: playMode, versionId: versionId));

  static const String name = 'CsvImportWebViewRoute';
}

class CsvImportWebViewRouteArgs {
  const CsvImportWebViewRouteArgs(
      {this.key, required this.playMode, required this.versionId});

  final _i15.Key? key;

  final _i16.PlayMode playMode;

  final int versionId;
}

/// generated route for [_i4.PlayLogPage]
class PlayLogRoute extends _i14.PageRouteInfo<void> {
  const PlayLogRoute() : super(name, path: '/playLogs');

  static const String name = 'PlayLogRoute';
}

/// generated route for [_i5.Sp12TierPage]
class Sp12TierRoute extends _i14.PageRouteInfo<void> {
  const Sp12TierRoute({List<_i14.PageRouteInfo>? children})
      : super(name, path: '/sp12Tier', initialChildren: children);

  static const String name = 'Sp12TierRoute';
}

/// generated route for [_i6.DailyPlayLogPage]
class DailyPlayLogRoute extends _i14.PageRouteInfo<DailyPlayLogRouteArgs> {
  DailyPlayLogRoute(
      {_i15.Key? key,
      required String dateString,
      List<_i14.PageRouteInfo>? children})
      : super(name,
            path: '/playLogs/:date',
            args: DailyPlayLogRouteArgs(key: key, dateString: dateString),
            rawPathParams: {'date': dateString},
            initialChildren: children);

  static const String name = 'DailyPlayLogRoute';
}

class DailyPlayLogRouteArgs {
  const DailyPlayLogRouteArgs({this.key, required this.dateString});

  final _i15.Key? key;

  final String dateString;
}

/// generated route for [_i7.ScorePage]
class ScoreRoute extends _i14.PageRouteInfo<ScoreRouteArgs> {
  ScoreRoute({_i15.Key? key, required int chartId})
      : super(name,
            path: 'summary', args: ScoreRouteArgs(key: key, chartId: chartId));

  static const String name = 'ScoreRoute';
}

class ScoreRouteArgs {
  const ScoreRouteArgs({this.key, required this.chartId});

  final _i15.Key? key;

  final int chartId;
}

/// generated route for [_i8.ChartPage]
class ChartRoute extends _i14.PageRouteInfo<ChartRouteArgs> {
  ChartRoute({_i15.Key? key, required int chartId})
      : super(name,
            path: 'chart', args: ChartRouteArgs(key: key, chartId: chartId));

  static const String name = 'ChartRoute';
}

class ChartRouteArgs {
  const ChartRouteArgs({this.key, required this.chartId});

  final _i15.Key? key;

  final int chartId;
}

/// generated route for [_i9.MemoPage]
class MemoRoute extends _i14.PageRouteInfo<MemoRouteArgs> {
  MemoRoute({_i15.Key? key, required int chartId})
      : super(name,
            path: 'memo', args: MemoRouteArgs(key: key, chartId: chartId));

  static const String name = 'MemoRoute';
}

class MemoRouteArgs {
  const MemoRouteArgs({this.key, required this.chartId});

  final _i15.Key? key;

  final int chartId;
}

/// generated route for [_i10.InfoPage]
class InfoRoute extends _i14.PageRouteInfo<InfoRouteArgs> {
  InfoRoute({_i15.Key? key, required int chartId})
      : super(name,
            path: 'info', args: InfoRouteArgs(key: key, chartId: chartId));

  static const String name = 'InfoRoute';
}

class InfoRouteArgs {
  const InfoRouteArgs({this.key, required this.chartId});

  final _i15.Key? key;

  final int chartId;
}

/// generated route for [_i11.Sp12TierListPage]
class Sp12TierListRoute extends _i14.PageRouteInfo<Sp12TierListRouteArgs> {
  Sp12TierListRoute({_i15.Key? key, required String mode})
      : super(name,
            path: ':mode',
            args: Sp12TierListRouteArgs(key: key, mode: mode),
            rawPathParams: {'mode': mode});

  static const String name = 'Sp12TierListRoute';
}

class Sp12TierListRouteArgs {
  const Sp12TierListRouteArgs({this.key, required this.mode});

  final _i15.Key? key;

  final String mode;
}

/// generated route for [_i12.PlaySummaryPage]
class PlaySummaryRoute extends _i14.PageRouteInfo<PlaySummaryRouteArgs> {
  PlaySummaryRoute({_i15.Key? key, required String dateString})
      : super(name,
            path: 'summary',
            args: PlaySummaryRouteArgs(key: key, dateString: dateString));

  static const String name = 'PlaySummaryRoute';
}

class PlaySummaryRouteArgs {
  const PlaySummaryRouteArgs({this.key, required this.dateString});

  final _i15.Key? key;

  final String dateString;
}

/// generated route for [_i13.PlayDetailPage]
class PlayDetailRoute extends _i14.PageRouteInfo<PlayDetailRouteArgs> {
  PlayDetailRoute({_i15.Key? key, required String dateString})
      : super(name,
            path: 'chart',
            args: PlayDetailRouteArgs(key: key, dateString: dateString));

  static const String name = 'PlayDetailRoute';
}

class PlayDetailRouteArgs {
  const PlayDetailRouteArgs({this.key, required this.dateString});

  final _i15.Key? key;

  final String dateString;
}
