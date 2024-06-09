import 'package:equatable/equatable.dart';
import 'package:flutter_trainning/domain/entitie/home_entity.dart';

enum AppHomePageStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final AppHomePageStatus status;
  final List<HomeEntity>? value;

  const HomeState({
    this.status = AppHomePageStatus.initial,
    this.value
  });

  HomeState copyWith({
    AppHomePageStatus? status,
    List<HomeEntity>? value
  }) {
    return HomeState(
        status: status ?? this.status,
        value: value ?? this.value
    );
  }

  @override
  List<Object> get props => [
    status,
    value!
  ];
}