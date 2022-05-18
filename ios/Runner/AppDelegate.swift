import UIKit
import Flutter
import flutter_boost

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
//    var window: UIWindow?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      FlutterBoost.instance().setup(application, delegate: nil, callback: nil)
      let vc = FBFlutterViewContainer.init()
      vc?.setName("application", uniqueId: "1234", params: [:], opaque: true)
      
      window = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
      window?.rootViewController = vc;
      window?.backgroundColor = UIColor.white;
      window?.makeKeyAndVisible();
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
