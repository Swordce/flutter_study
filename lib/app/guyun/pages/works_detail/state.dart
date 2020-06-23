import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:study/app/guyun/bean/search_works.dart';
import 'package:study/widgets/floatmenu/floating_menu_item.dart';

class WorksDetailState implements Cloneable<WorksDetailState>{

  Work work;

  List<FloatingMenuItem> menuList;

  @override
  WorksDetailState clone() {
    return WorksDetailState()
    ..work = work;

  }

}

WorksDetailState initState(Map<String, dynamic> args) {
  WorksDetailState state = WorksDetailState();
  state.work = args['work'];
  state.menuList = [
    FloatingMenuItem(id: 3, icon: Icons.help_outline, backgroundColor: Colors.deepOrangeAccent,title: '注'),
    FloatingMenuItem(id: 2, icon: Icons.map, backgroundColor: Colors.brown,title:'译'),
    FloatingMenuItem(id: 1, icon: Icons.email, backgroundColor: Colors.indigo,title: '析'),
  ];

  return state;
}
