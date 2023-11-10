import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/data.dart';
import '../../../data/model/model.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

enum LoadingStatus { initial, loading, loaded }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DioClient _dioClient = DioClient();

  HomeBloc() : super(const _Initial()) {
    on<_GetData>(_getData);
    on<_FindPlaces>(_findPlace);
  }

  Future<void> _getData(_GetData event, Emitter emitter) async {
    emitter(state.copyWith(loadingStatus: LoadingStatus.loading));
    try {
      final data = await _dioClient.getWeather(event.lat, event.lon);
      emitter(state.copyWith(loadingStatus: LoadingStatus.loaded, weatherModel: data));
    } on Exception catch (e) {
      emitter(state.copyWith(loadingStatus: LoadingStatus.loaded));
      debugPrint(e.toString());
    }
  }

  Future<void> _findPlace(_FindPlaces event, Emitter emitter) async {
    emitter(state.copyWith(loadingStatus: LoadingStatus.loading));
    try {
      final data = await _dioClient.getLocation(event.inputLocation);
      emitter(state.copyWith(loadingStatus: LoadingStatus.loaded, locationModel: data));
    } on Exception catch (e) {
      emitter(state.copyWith(loadingStatus: LoadingStatus.loaded));
      debugPrint(e.toString());
    }
  }
}
