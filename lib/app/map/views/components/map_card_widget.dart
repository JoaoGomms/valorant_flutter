import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:valorant_flutter/app/map/models/map_model.dart';

class MapCardWidget extends StatefulWidget {
  final MapModel map;
  const MapCardWidget({Key? key, required this.map}) : super(key: key);

  @override
  State<MapCardWidget> createState() => _MapCardWidgetState();
}

class _MapCardWidgetState extends State<MapCardWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: ((context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.map.imageUrl),
          Text(widget.map.miniMapImageUrl),
          Text(widget.map.name),
        ],
      );
    }));
  }
}
