import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../gen/fonts.gen.dart';
import '../../widget/common/common.dart';
import '../../base/base.dart';
import '../../gen/colors.gen.dart';

import '../../utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String? title;
  final bool? hasDrawer;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    this.bottom,
    this.title,
    this.hasDrawer,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return AppBar(
          automaticallyImplyLeading: !(hasDrawer ?? true),
          leading: leading ??
              IconButton(
                icon: (hasDrawer ?? false)
                    ? Icon(
                        Icons.menu,
                        color: themeNotifier.isDark ? ColorName.darkBlue : ColorName.white,
                      )
                    : Icon(
                        Icons.arrow_back_ios,
                        color: themeNotifier.isDark ? ColorName.darkBlue : ColorName.white,
                      ),
                onPressed: () {
                  (hasDrawer ?? false) ? Scaffold.of(context).openDrawer() : RouterHelper.pop(context);
                },
              ),
          shadowColor: themeNotifier.isDark ? ColorName.gray : ColorName.black,
          backgroundColor: themeNotifier.isDark ? ColorName.black : ColorName.white,
          title: CustomText(
            fontFamily: FontFamily.roboto,
            text: title ?? TextConstants.appTitle,
            style: TextStyle(
              color: themeNotifier.isDark ? ColorName.white : ColorName.black,
            ),
          ),
          centerTitle: true,
        );
      },
    );
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(kToolbarHeight, bottom?.preferredSize.height);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
