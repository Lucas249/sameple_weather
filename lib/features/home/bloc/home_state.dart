part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    WeatherModel? weatherModel,
    LocationModel? locationModel,
  }) = _Initial;
}
