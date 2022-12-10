import 'package:mobx/mobx.dart';
import 'package:valorant_flutter/app/tiers/models/tier_model.dart';
import 'package:valorant_flutter/app/tiers/services/tier_service.dart';
part 'tier_controller.g.dart';

class TierController = _TierControllerBase with _$TierController;

abstract class _TierControllerBase with Store {
  final TierService tierService;

  _TierControllerBase(this.tierService);

  ObservableList<TierModel> tierList = ObservableList();

  @action
  Future<void> fetchTiers() async {
    try {
      List<TierModel> response = await tierService.getTiers();

      tierList.addAll(response);
    } catch (e) {
      print(e);
    }
  }
}
