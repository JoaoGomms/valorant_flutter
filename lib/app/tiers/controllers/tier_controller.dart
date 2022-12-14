import 'package:mobx/mobx.dart';
import 'package:valorant_flutter/app/tiers/models/tier_model.dart';
import 'package:valorant_flutter/app/tiers/services/tier_service.dart';
part 'tier_controller.g.dart';

class TierController = _TierControllerBase with _$TierController;

abstract class _TierControllerBase with Store {
  final TierService tierService;

  _TierControllerBase(this.tierService);

  ObservableList<TierModel> tierList = ObservableList();

  @observable
  bool isLoadingTiers = false;

  @action
  Future<void> fetchTiers() async {
    isLoadingTiers = true;
    try {
      List<TierModel> response = await tierService.getTiers();

      tierList.addAll(response);
      tierList.removeWhere((tier) => tier.tierName.contains('Unused'));
      isLoadingTiers = false;
    } catch (e) {
      isLoadingTiers = false;
    }
  }
}
