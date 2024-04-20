import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:knkpanime/pages/favorite/favorite_controller.dart';
import 'package:knkpanime/pages/favorite/favorite_module.dart';
import 'package:knkpanime/pages/history/history_controller.dart';
import 'package:knkpanime/pages/history/history_module.dart';
import 'package:knkpanime/pages/play/play_module.dart';
import 'package:knkpanime/pages/search/adapter_search_controller.dart';
import 'package:knkpanime/pages/search/search_module.dart';
import 'package:knkpanime/pages/settings/settings_page.dart';
import 'package:knkpanime/pages/today/today_controller.dart';
import 'package:knkpanime/pages/search/bangumi_search_controller.dart';
import 'package:logger/logger.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(Logger());
    i.addSingleton(TodayController.new);
    i.addSingleton(BangumiSearchController.new);
    i.addSingleton(HistoryController.new);
    i.addSingleton(FavoriteController.new);
    i.addSingleton(AdapterSearchController.new);
  }

  @override
  void routes(r) {
    //r.module('/today/',
    //    module: TodayModule(), transition: TransitionType.noTransition);
    r.module('/search/',
        module: SearchModule(), transition: TransitionType.noTransition);
    r.module('/play/',
        module: PlayModule(), transition: TransitionType.noTransition);
    r.module('/history/',
        module: HistoryModule(), transition: TransitionType.noTransition);
    r.module('/favorite/',
        module: FavoriteModule(), transition: TransitionType.noTransition);
    r.child('/settings',
        child: (context) => SettingsPage(),
        transition: TransitionType.noTransition);
  }
}

const routes = [
  {
    'path': '/search/bangumi',
    'name': 'Bangumi搜索',
    'icon': Icon(Icons.search),
    'bottom': false,
  },
  {
    'path': '/search/adapter',
    'name': '番剧源搜索',
    'icon': Icon(Icons.search),
    'bottom': false,
  },
  {
    'path': '/history/',
    'name': '历史记录',
    'icon': Icon(Icons.history),
    'bottom': false,
  },
  {
    'path': '/favorite/',
    'name': '追番',
    'icon': Icon(Icons.favorite),
    'bottom': false,
  },
  {
    'path': '/settings',
    'name': '设置',
    'icon': Icon(Icons.settings),
    'bottom': true,
  },
];
