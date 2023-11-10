part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getData(double lat, double lon) = _GetData;

  const factory HomeEvent.findPlace(String inputLocation) = _FindPlaces;
}
