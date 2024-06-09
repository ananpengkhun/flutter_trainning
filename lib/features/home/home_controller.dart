import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class Counter extends StateNotifier<int>{
  Counter() : super(0);

  void increment() => state++;
}

final counterProvider = StateNotifierProvider((ref) => Counter());

///
final counterProvider2 = StateProvider((ref) => 0);

///
final configurationsProvider = FutureProvider<Configuration>((ref)async{
  await Future.delayed(const Duration(seconds: 1));
  return Configuration();
});


class Configuration{}
///
class UserController extends StateNotifier<User>{
  UserController() : super(User());

  dataObjToSet(){
    var setUser = Set<String>();
    var listUser = <User>[
      User(userName: "anan",lastName: "peng"),
      User(userName: "anan",lastName: "peng"),
      User(userName: "anan2",lastName: "peng2"),
      User(userName: "anan2",lastName: "peng2"),
    ];

    var uniq = listUser.where((element) => setUser.add(element.userName ?? "")).toList();

    debugPrint("data :${uniq.map((e) => e.userName).toString()}");


  }

  void setUserName(String newName){
    state = state.copyWith(a:newName, b:state.lastName);
  }
}

final userProvider = StateNotifierProvider<UserController, User>((ref) => UserController());

class User{
  String? userName;
  String? lastName;

  User({this.userName, this.lastName});

  User copyWith({
    String? a,String? b
  }) {
    return User(
        userName: a,
        lastName: b
    );
  }
}

///
final sss = Provider.family<User, User>((ref, id){
  return User();
});
///
// var firstProvider = Provider.autoDispose((ref) => 0);
// var secondProvider = Provider.autoDispose((ref) {
//   ref.on
//   ref.watch(firstProvider);
// });