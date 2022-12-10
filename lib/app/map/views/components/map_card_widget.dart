import 'package:cached_network_image/cached_network_image.dart';
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
    return Container(
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.9),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(widget.map.imageUrl)),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
