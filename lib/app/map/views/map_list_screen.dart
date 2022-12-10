import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/map/controller/map_list_controller.dart';
import 'package:valorant_flutter/core/components/app_bar_valorant.dart';
import 'package:valorant_flutter/core/components/top_title_valorant.dart';

import 'components/map_tile_widget.dart';

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
    return Scaffold(
      appBar: appBarValorant(),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Observer(builder: (context) {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  var actualMap = controller.mapsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: MapTileWidget(map: actualMap),
                  );
                }),
                itemCount: controller.mapsList.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
