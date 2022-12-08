import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/map/controller/map_list_controller.dart';

import 'components/map_card_widget.dart';

class MapListScreen extends StatefulWidget {
  const MapListScreen({Key? key}) : super(key: key);

  @override
  State<MapListScreen> createState() => _MapListScreenState();
}

class _MapListScreenState extends State<MapListScreen> {
  MapListController controller = GetIt.I<MapListController>();

  @override
  void initState() {
    super.initState();
    controller.fetchMapList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.mapsList.length,
        itemBuilder: ((context, index) {
          var actualMap = controller.mapsList[index];
          return MapCardWidget(map: actualMap);
        }));
  }
}
