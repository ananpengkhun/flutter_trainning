import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_trainning/constants/pref_constant.dart';
import 'package:flutter_trainning/features/home/home_controller.dart';
import 'package:flutter_trainning/utils/extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget{

  @override
  Widget build(BuildContext context,ref) {
    User count = ref.watch(userProvider);

    ref.listen(userProvider, (previous, next) {
      debugPrint("userProvider previous :${previous?.userName}");
      debugPrint("userProvider next :${next.userName}");
    });
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.loc.home),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("user name :${count.userName ?? "have no data"}"),
            TextButton(onPressed: (){

            }, child: Text("Login screen")),
            TextButton(onPressed: (){

            }, child: Text("Settings screen"))


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(userProvider.notifier).setUserName("anan");
          ref.read(userProvider.notifier).dataObjToSet();
          // ref.refresh(userProvider);/// clear provider
          //ref.read(counterProvider2.notifier).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _incrementCounter(){

  }
}





