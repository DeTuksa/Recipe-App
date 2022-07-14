import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/6300978111';
      return 'ca-app-pub-7809889091078884/4620192043';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_BANNER_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  /*static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7809889091078884/7274275540';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }*/

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/3419835294';
      return 'ca-app-pub-7809889091078884/3530471653';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_REWARDED_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}