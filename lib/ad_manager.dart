import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5295564814934759~3504497132";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5295564814934759~3504497132";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5295564814934759/2801472326";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5295564814934759/2801472326";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5295564814934759/9175308984";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5295564814934759/9175308984";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }


}


