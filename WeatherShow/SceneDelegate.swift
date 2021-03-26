//
//  SceneDelegate.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/16/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScnee = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScnee.coordinateSpace.bounds)
        window?.windowScene = windowScnee
        window?.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.1529411765, blue: 0.1803921569, alpha: 1)

//        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.darkText,
//                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .semibold),
//                     NSAttributedString.Key.backgroundColor : UIColor.clear]
//        UINavigationBar.appearance().titleTextAttributes = attrs
//        UINavigationBar.appearance().barTintColor = .white
//        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.137254902, green: 0.1529411765, blue: 0.1803921569, alpha: 1)
//        UINavigationController().navigationItem.largeTitleDisplayMode = .always
//        UINavigationController().navigationBar.prefersLargeTitles = true

        let vc = createNavController(for: HomeVC(), title: "Weather", image: UIImage(systemName: "thermometer.sun.fill")!)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
        
        rootViewController.navigationItem.title = title
        rootViewController.navigationItem.largeTitleDisplayMode = .always
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        let attrs = [NSAttributedString.Key.foregroundColor: .label,
                     NSAttributedString.Key.backgroundColor : UIColor.clear]
        navController.navigationBar.largeTitleTextAttributes = attrs

//        navController.navigationBar.tintColor = .darkGray
        return navController
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

