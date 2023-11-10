import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../base/extension/extension.dart';

class RouterHelper {
  RouterHelper._();

  static Future<Object?> push(BuildContext context, {String? route, Object? arguments}) async {
    if (route?.isNotNullOrEmpty ?? false) {
      final result = await context.push(route!, extra: arguments);

      if (result != null) {
        return result;
      }
    }
    return null;
  }

  static void pop(BuildContext context, {Object? arguments}) {
    context.pop(arguments);

    return;
  }

  static void go(BuildContext context, {String? route, Object? arguments}) {
    if (route?.isNotNullOrEmpty ?? false) {
      context.go(route!, extra: arguments);

      return;
    }
  }
}
