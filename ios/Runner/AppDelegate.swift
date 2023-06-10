import UIKit
import Flutter
import Firebase
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)

    // load environment variable for google maps
    let googleMapsApiKey = Bundle.main.infoDictionary?["GOOGLE_MAPS_API_KEY"] as! String 
    GMSServices.provideAPIKey(googleMapsApiKey)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    /*override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let firebaseAuth = Auth.auth()
        firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
    }*/
}
