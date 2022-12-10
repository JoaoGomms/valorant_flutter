import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
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
    return Column(
      children: [
        const Flexible(
          flex: 2,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 32, bottom: 32),
              child: Image(
                height: 56,
                image: AssetImage(
                  'assets/valorant_icon.png',
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: Observer(builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ScrollSnapList(
                  selectedItemAnchor: SelectedItemAnchor.START,
                  itemBuilder: ((context, index) {
                    var actualMap = controller.mapsList[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: MapCardWidget(map: actualMap),
                    );
                  }),
                  itemCount: controller.mapsList.length,
                  itemSize: MediaQuery.of(context).size.width * 0.5,
                  onItemFocus: (index) {}),
            );
          }),
        ),
      ],
    );
  }
}
