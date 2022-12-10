import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/map/models/map_model.dart';

class MapTileWidget extends StatefulWidget {
  final MapModel map;
  const MapTileWidget({Key? key, required this.map}) : super(key: key);

  @override
  State<MapTileWidget> createState() => _MapTileWidgetState();
}

class _MapTileWidgetState extends State<MapTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.15),
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(widget.map.imageUrl)),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  height: 50,
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                      child: Text(
                    widget.map.name,
                    style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
