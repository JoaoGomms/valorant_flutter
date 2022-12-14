import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/tiers/controllers/tier_controller.dart';
import 'package:valorant_flutter/app/tiers/views/components/tier_card.dart';
import 'package:valorant_flutter/core/components/app_bar_valorant.dart';

import '../models/tier_model.dart';

class TierListScreen extends StatefulWidget {
  const TierListScreen({Key? key}) : super(key: key);

  @override
  State<TierListScreen> createState() => _TierListScreenState();
}

class _TierListScreenState extends State<TierListScreen> {
  TierController tierController = GetIt.I.get<TierController>();

  @override
  void initState() {
    super.initState();
    tierController.fetchTiers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarValorant(),
      body: Observer(builder: (context) {
        return Column(mainAxisSize: MainAxisSize.max, children: [
          tierController.isLoadingTiers
              ? const Center(child: CircularProgressIndicator())
              : Flexible(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: tierController.tierList.length,
                      itemBuilder: (context, index) {
                        TierModel actualItem = tierController.tierList[index];
                        return TierCard(tier: actualItem);
                      }))
        ]);
      }),
    );
  }
}
