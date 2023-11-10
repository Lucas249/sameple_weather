import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/base.dart';
import '../../gen/colors.gen.dart';
import '../../utils/utils.dart';
import '../widget.dart';

const List<Color> _defaultLightBarColors = [
  ColorName.black,
  ColorName.blueViolet,
  ColorName.darkBlue,
];

const List<Color> _defaultDarkBarColors = [
  ColorName.white,
  ColorName.blueViolet,
  ColorName.lightBlue,
];

const double _defaultSize = 150.0;

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  Widget getSizeLoadingBuilder(BuildContext context, double? size) {
    return GestureDetector(
      onTap: () => RouterHelper.pop(context),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(NumberConstants.size12),
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(NumberConstants.size16),
            ),
            child: _loadingBuilder(context, size),
          ),
        ],
      ),
    );
  }

  Widget _loadingBuilder(context, double? loadingSize) {
    return GestureDetector(
      onTap: () => RouterHelper.pop(context),
      child: Consumer<ModelTheme>(
        builder: (context, themeNotifier, child) {
          return CircularSliderWidget(
            initialValue: 0,
            min: 0,
            max: 100,
            appearance: CircularSliderAppearance(
              size: loadingSize ?? _defaultSize,
              spinnerDuration: 5000,
              spinnerMode: true,
              customWidths: CustomSliderWidths(
                shadowWidth: NumberConstants.size8,
                progressBarWidth: NumberConstants.size4,
              ),
              customColors: CustomSliderColors(
                trackColor: Colors.transparent,
                progressBarColors: themeNotifier.isDark ? _defaultLightBarColors : _defaultDarkBarColors,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loadingBuilder(context, _defaultSize);
  }
}
