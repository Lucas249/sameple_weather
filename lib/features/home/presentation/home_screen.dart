import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../utils/utils.dart';
import '../../../widget/widget.dart';
import '../../features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textEditingController = TextEditingController();
  ValueNotifier selectedIndex = ValueNotifier<int>(0);
  double? cityLat = 0.0;
  double? cityLon = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leading: SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NumberConstants.size16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                fontFamily: FontFamily.roboto,
                text: TextConstants.findPlaces,
                style: TextStyle(
                  color: ColorName.blue,
                  fontSize: NumberConstants.size18,
                ),
              ),
              const SizedBox(height: NumberConstants.size12),
              CustomTextField(
                hintStyle: const TextStyle(
                  color: ColorName.blueViolet,
                  fontSize: NumberConstants.size30,
                ),
                hintText: TextConstants.findPlaces,
                textEditingController: textEditingController,
                onSubmitted: (value) {
                  context.read<HomeBloc>().add(HomeEvent.findPlace(value));
                },
                inputDecoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: textEditingController.clear,
                    icon: const Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorName.black,
                      width: NumberConstants.size8,
                    ),
                    borderRadius: BorderRadius.circular(
                      NumberConstants.size8,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: NumberConstants.size20),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  LoadingStatus status = state.loadingStatus;

                  if (status == LoadingStatus.initial) {
                    return const SizedBox();
                  } else if (status == LoadingStatus.loaded) {
                    final listCity = state.locationModel?.data;
                    final weatherStatus =
                        state.weatherModel?.weather?.firstWhere((element) => element.main.isNotNullOrEmpty).main;
                    final temp = state.weatherModel?.main?.temp ?? 0 / 10;

                    return Column(
                      children: [
                        if (listCity.isNotNullOrEmpty)
                          ...List.generate(
                            listCity!.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: NumberConstants.size8),
                                child: GestureDetector(
                                  onTap: () {
                                    cityLat = listCity[index].latitude;
                                    cityLon = listCity[index].longitude;
                                    selectedIndex.value = index;
                                    context.read<HomeBloc>().add(HomeEvent.getData(cityLat!, cityLon!));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.all(NumberConstants.size16),
                                    decoration: BoxDecoration(
                                      color: selectedIndex.value == index ? ColorName.black : ColorName.white,
                                      borderRadius: BorderRadius.circular(
                                        NumberConstants.size8,
                                      ),
                                      border: Border.all(
                                        color: selectedIndex.value == index ? ColorName.white : ColorName.gray,
                                      ),
                                    ),
                                    child: CustomText(
                                      style: TextStyle(
                                        color: selectedIndex.value == index ? ColorName.white : ColorName.black,
                                        fontSize: NumberConstants.size18,
                                      ),
                                      text: listCity[index].name ?? '',
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        else
                          const CustomText(
                            text: TextConstants.emptyValue,
                            style: TextStyle(
                              color: ColorName.red,
                              fontSize: NumberConstants.size30,
                            ),
                          ),
                        if (weatherStatus.isNotNullOrEmpty) ...[
                          const SizedBox(height: NumberConstants.size8),
                          CustomText(
                            style: const TextStyle(
                              color: ColorName.goldenrod,
                              fontSize: NumberConstants.size30,
                            ),
                            text: '$temp °C',
                          ),
                          const SizedBox(height: NumberConstants.size8),
                          CustomText(
                            style: const TextStyle(
                              color: ColorName.blueViolet,
                              fontSize: NumberConstants.size30,
                            ),
                            text: weatherStatus,
                          ),
                          WeatherHelper.getWeatherType(weatherStatus!),
                        ]
                      ],
                    );
                  } else {
                    return Center(child: const LoadingWidget().getSizeLoadingBuilder(context, NumberConstants.size50));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
