import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_flutter/extensions/string_to_color.dart';

import '../../models/tier_model.dart';

class TierCard extends StatefulWidget {
  final TierModel tier;
  const TierCard({Key? key, required this.tier}) : super(key: key);

  @override
  State<TierCard> createState() => _TierCardState();
}

class _TierCardState extends State<TierCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: tierCardDecoration(),
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: widget.tier.iconUrl),
            Text(widget.tier.tierName),
          ],
        ),
      ),
    );
  }

  BoxDecoration tierCardDecoration() {
    return BoxDecoration(color: widget.tier.hexBackgroundColor.toColor(), borderRadius: BorderRadius.circular(8));
  }
}
