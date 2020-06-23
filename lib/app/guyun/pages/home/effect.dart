import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:study/app/guyun/bean/all_collections.dart';
import 'package:study/app/guyun/bean/collections_data.dart';
import 'package:study/app/guyun/bean/search_author.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/http_utils.dart';
import 'package:study/utils/loading.dart';
import 'package:study/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

CollectionsData _onGenerateData(String title, List<Result> results, int index) {
  CollectionsData bean1 = new CollectionsData();
  bean1.title = title;
  bean1.result = results;
  bean1.index = index;
  return bean1;
}

void _onInit(Action action, Context<HomeState> ctx) async {

  LoadingUtils.showLoading();

  HttpUtils.getInstance().post('${Constants.GUYUN_API}getAllCollections',
      success: (result) {
    List<Result> kindOne = List();
    List<Result> kindTwo = List();
    List<Result> kindThree = List();
    List<Result> kindFour = List();
    List<Result> kindFive = List();
    List<Result> kindSix = List();
    List<Result> kindSeven = List();
    List<Result> kindEight = List();
    List<Result> kindNine = List();
    List<Result> kindTen = List();
    List<Result> kindEleven = List();
    AllCollectionsBean allCollections = AllCollectionsBean.fromJson(result);
    for (Result result in allCollections.result) {
      switch (result.kindId) {
        case 1:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '选集';
          kindOne.add(result);
          break;
        case 2:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '主题';
          kindTwo.add(result);
          break;
        case 3:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '写景';
          kindThree.add(result);
          break;
        case 4:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '节日';
          kindFour.add(result);
          break;
        case 5:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '节气';
          kindFive.add(result);
          break;
        case 6:
          if (result.name.contains('小学')) {
            CollectionsData bean1 = new CollectionsData();
            bean1.title = '小学';
            kindSix.add(result);
          } else if (result.name.contains('初一') ||
              result.name.contains('初二') ||
              result.name.contains('初三') ||
              result.name.contains('初中')) {
            CollectionsData bean1 = new CollectionsData();
            bean1.title = '初中';
            kindSeven.add(result);
          } else if (result.name.contains('高一') ||
              result.name.contains('高二') ||
              result.name.contains('高三') ||
              result.name.contains('高中')) {
            CollectionsData bean1 = new CollectionsData();
            bean1.title = '高中';
            kindEight.add(result);
          }
          break;
        case 7:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '词牌';
          kindNine.add(result);
          break;
        case 8:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '时令';
          kindTen.add(result);
          break;
        case 9:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '用典';
          kindEleven.add(result);
          break;
        case 10:
          CollectionsData bean1 = new CollectionsData();
          bean1.title = '主题';
          kindTwo.add(result);
          break;
      }
    }
    ctx.state.kind.add(_onGenerateData('用典', kindEleven, 1));
    ctx.state.kind.add(_onGenerateData('选集', kindOne, 2));
    ctx.state.kind.add(_onGenerateData('主题', kindTwo, 3));
    ctx.state.kind.add(_onGenerateData('写景', kindThree, 4));
    ctx.state.kind.add(_onGenerateData('节日', kindFour, 5));
    ctx.state.kind.add(_onGenerateData('节气', kindFive, 6));
    ctx.state.kind.add(_onGenerateData('时令', kindTen, 7));
    ctx.state.kind.add(_onGenerateData('词牌', kindNine, 8));
    ctx.state.kind.add(_onGenerateData('小学', kindSix, 9));
    ctx.state.kind.add(_onGenerateData('初中', kindSeven, 10));
    ctx.state.kind.add(_onGenerateData('高中', kindEight, 11));
    ctx.dispatch(HomeActionCreator.onRefresh());
    LoadingUtils.hideLoading();
  });

  _getHotAuthors(ctx);
}

void _getHotAuthors(Context<HomeState> ctx) {
  HttpUtils.getInstance().post('${Constants.GUYUN_API}getHotAuthors',
      success: (result) {
    if (result['result'] != null && result['result'].length > 0) {
      SearchAuthorBean bean = SearchAuthorBean.fromJson(result);
      ctx.state.hotAuthors.clear();
      ctx.state.hotAuthors.addAll(bean.result);
    }
  });
}
