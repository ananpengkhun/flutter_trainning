import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trainning/features/feed/state/home_state.dart';
import 'package:flutter_trainning/gen/assets.gen.dart';
import 'feed_provider.dart';
import 'package:flutter_trainning/utils/extension.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() {
    return _FeedScreenState();
  }
}

class _FeedScreenState extends ConsumerState<FeedScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homePageStateProvider.notifier).getTestData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataObs = ref.watch(homePageStateProvider);
    if(dataObs.status != AppHomePageStatus.success){
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.home,),),
      body: Column(
        children: [
          Assets.cat.image(),
          Expanded(
            child: ListView.builder(
              itemCount: dataObs.value?.length ?? 0,
              itemBuilder: (context, index) {
              return Text(dataObs.value?[index].name ?? "");
            }),
          ),
        ],
      ),
    );
  }


}
