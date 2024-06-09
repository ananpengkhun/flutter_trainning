import 'package:flutter_trainning/config/network/app_dio_option.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trainning/data/datasource/remote/datasources/home_datasources.dart';
import 'package:flutter_trainning/data/datasource/remote/home_remote.dart';
import 'package:flutter_trainning/data/repository/home_repository_impl.dart';
import 'package:flutter_trainning/domain/repository/home_repository.dart';
import 'package:flutter_trainning/features/feed/feed_controller.dart';
import 'package:flutter_trainning/features/feed/state/home_state.dart';


final homeRemoteDataSource = Provider<HomeDatasource>((ref) => HomeRemote(dio: ref.read(getDioOption).initDioOption()));
final homeRepositoryProvider = Provider<HomeRepository>((ref) => HomeRepositoryImpl(
    homeDatasource :ref.read(homeRemoteDataSource)
));
final homePageStateProvider = StateNotifierProvider<FeedController, HomeState>(
      (ref) => FeedController(
        homeRepo: ref.read(homeRepositoryProvider),
  ),
);
