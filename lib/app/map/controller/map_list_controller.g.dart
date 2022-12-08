// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapListController on _MapListControllerBase, Store {
  late final _$mapsListAtom =
      Atom(name: '_MapListControllerBase.mapsList', context: context);

  @override
  ObservableList<MapModel> get mapsList {
    _$mapsListAtom.reportRead();
    return super.mapsList;
  }

  @override
  set mapsList(ObservableList<MapModel> value) {
    _$mapsListAtom.reportWrite(value, super.mapsList, () {
      super.mapsList = value;
    });
  }

  late final _$_MapListControllerBaseActionController =
      ActionController(name: '_MapListControllerBase', context: context);

  @override
  void fetchMapList() {
    final _$actionInfo = _$_MapListControllerBaseActionController.startAction(
        name: '_MapListControllerBase.fetchMapList');
    try {
      return super.fetchMapList();
    } finally {
      _$_MapListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mapsList: ${mapsList}
    ''';
  }
}
