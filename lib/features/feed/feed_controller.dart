import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trainning/domain/repository/home_repository.dart';
import 'package:flutter_trainning/features/feed/state/home_state.dart';

class FeedController extends StateNotifier<HomeState>{
  HomeRepository homeRepo;

  FeedController({required this.homeRepo}): super(const HomeState());

  Future<void> getTestData() async {
    state = state.copyWith(status: AppHomePageStatus.loading);
    var result = await homeRepo.getListPokemon(12);

    result.whenWithResult((result) {
      state = state.copyWith(status: AppHomePageStatus.success,value: result.value);
    }, (error){
      state = state.copyWith(status: AppHomePageStatus.failure, );
    });
  }

}