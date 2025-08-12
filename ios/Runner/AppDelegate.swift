import UIKit
import Flutter
import GoogleSignIn
import Firebase
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    FirebaseApp.configure()

    GeneratedPluginRegistrant.register(with: self)

    // ✅ إعداد الإشعارات
    UNUserNotificationCenter.current().delegate = self

    // ✅ تسجيل للحصول على APNs token
    application.registerForRemoteNotifications()

    // ✅ إعداد Google Sign-In
    GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: "777749023615-7nngmna3d2q823532pis2t26cd1agkf9.apps.googleusercontent.com")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
    return GIDSignIn.sharedInstance.handle(url)
  }
}


// import UIKit
// import Flutter
// import GoogleSignIn
//
// @main
// @objc class AppDelegate: FlutterAppDelegate {
// override func application(
// _ application: UIApplication,
// didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
// ) -> Bool {
// GeneratedPluginRegistrant.register(with: self)
//
// if #available(iOS 10.0, *) {
// UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
// }
//
// // ✅ Corrected Google Sign-In Configuration
// GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: "777749023615-7nngmna3d2q823532pis2t26cd1agkf9.apps.googleusercontent.com")
//
// return super.application(application, didFinishLaunchingWithOptions: launchOptions)
// }
//
// override func application(
// _ app: UIApplication,
// open url: URL,
// options: [UIApplication.OpenURLOptionsKey: Any] = [:]
// ) -> Bool {
// return GIDSignIn.sharedInstance.handle(url)
// }
// }
