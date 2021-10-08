import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  static const int MOBILE_WIDTH_MAX = 414;
  static const int MOBILE_WIDTH_MIN = 360;
  static const int MOBILE_HEIGHT_MIN = 568;
  static const int MOBILE_HEIGHT_MAX = 823;
  static const int TABLET_MAX_WIDTH = 1024;
  static const int TABLET_MIN_WIDTH = 768;
  static const int TABLET_MAX_HEIGHT = 1366;
  static const int TABLET_MIN_HEIGHT = 1024;
  const ResponsiveLayout({
    required this.mobile_vertical,
    required this.tablet_vertical,
    required this.mobile_horizontal,
    required this.tablet_horizontal,
    required this.desktop,
  });
  final Widget mobile_vertical;
  final Widget tablet_vertical;
  final Widget mobile_horizontal;
  final Widget tablet_horizontal;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? buildVerticalLayoutBuilder()
            : buildHorizontalLayoutBuilder());
  }

  LayoutBuilder buildHorizontalLayoutBuilder() {
    return LayoutBuilder(builder: (context, constraints) {
      // if our width is more than 1100 thwn we consider it is a desktop
      if (constraints.maxWidth > TABLET_MAX_HEIGHT) {
        print('DESKTOP HORIZONTAL');
        return desktop;
      }
      // if our width is less than 1100 and more than 420 then we consider it is a tablet
      else if (constraints.maxWidth > MOBILE_HEIGHT_MAX) {
        print('TABLET HORIZONTAL');
        return tablet_horizontal;
      }
      // or less then that we called it mobile
      else {
        print('MOBILE HORIZONTAL');
        return mobile_horizontal;
      }
    });
  }

  LayoutBuilder buildVerticalLayoutBuilder() {
    return LayoutBuilder(builder: (context, constraints) {
      // if our width is more than 1100 thwn we consider it is a desktop
      if (constraints.maxWidth > TABLET_MAX_WIDTH) {
        print('DESKTOP VERTICAL');
        return desktop;
      }
      // if our width is less than 1100 and more than 420 then we consider it is a tablet
      else if (constraints.maxWidth > MOBILE_WIDTH_MAX) {
        print('TABLET VERTICAL');
        return tablet_vertical;
      }
      // or less then that we called it mobile
      else {
        print('MOBILE VERTICAL');
        return mobile_vertical;
      }
    });
  }
}
