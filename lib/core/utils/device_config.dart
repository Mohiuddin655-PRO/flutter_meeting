import 'dart:io';
import 'dart:ui';

class DeviceConfig {
  final Device mobile, tab, laptop, desktop, tv;

  const DeviceConfig({
    this.mobile = const Device(
      x: Device.mobileX,
      y: Device.mobileY,
      fontVariant: Device.mobileVariant,
      name: 'Mobile',
    ),
    this.tab = const Device(
      x: Device.tabX,
      y: Device.tabY,
      fontVariant: Device.tabVariant,
      name: 'Tab',
    ),
    this.laptop = const Device(
      x: Device.laptopX,
      y: Device.laptopY,
      fontVariant: Device.laptopVariant,
      name: 'Laptop',
    ),
    this.desktop = const Device(
      x: Device.desktopX,
      y: Device.desktopY,
      fontVariant: Device.desktopVariant,
      name: 'Desktop',
    ),
    this.tv = const Device(
      x: Device.tvX,
      y: Device.tvY,
      fontVariant: Device.tvVariant,
      name: 'TV',
    ),
  });

  bool get isAndroid => Platform.isAndroid;

  bool get isFuchsia => Platform.isFuchsia;

  bool get isIOS => Platform.isIOS;

  bool get isLinux => Platform.isLinux;

  bool get isMacOS => Platform.isMacOS;

  bool get isWindows => Platform.isWindows;

  bool isMobile(double cx, double cy) => isDevice(mobile, cx, cy);

  bool isTab(double cx, double cy) => isDevice(tab, cx, cy);

  bool isLaptop(double cx, double cy) => isDevice(laptop, cx, cy);

  bool isDesktop(double cx, double cy) => isDevice(desktop, cx, cy);

  bool isDevice(Device device, double cx, double cy) {
    final x = device.aspectRatio;
    final y = device.ratio(cx, cy);
    // print('\n${device.name}\t => X : ${x.toStringAsFixed(2)}');
    // print('${device.name}\t => Y : ${y.toStringAsFixed(2)}');
    return x > y;
  }
}

class Device extends Size {
  static const double mobileX = 10, mobileY = 16, mobileVariant = 3.6;
  static const double tabX = 1, tabY = 1, tabVariant = 5;
  static const double laptopX = 16, laptopY = 10, laptopVariant = 6;
  static const double desktopX = 16, desktopY = 8, desktopVariant = 7;
  static const double tvX = 0, tvY = 0, tvVariant = 8;

  final String name;
  final double fontVariant;

  const Device({
    required double x,
    required double y,
    this.name = 'Unknown',
    this.fontVariant = 0,
  }) : super(x, y);

  @override
  double get width => super.width > 100 ? super.width : super.width * 100;

  @override
  double get height => super.height > 100 ? super.height : super.height * 100;

  double rationalWidth(double cx) => cx * aspectRatio;

  double rationalHeight(double cy) => cy * aspectRatio;

  double ratioX(double cx) => rationalWidth(cx) / 100;

  double ratioY(double cy) => rationalHeight(cy) / 100;

  double ratio(double cx, double cy) => Size(cx, cy).aspectRatio;
}
