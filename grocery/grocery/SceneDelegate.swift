//
//  SceneDelegate.swift
//  grocery
//
//  Created by Szymon Gęsicki on 02/08/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        vc1.tabBarItem.image = UIImage(named: "home")?.scale(scaledToWidth: 25)

        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.white
        vc2.tabBarItem.image = UIImage(named: "heart")?.scale(scaledToWidth: 25)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.white
        vc3.tabBarItem.image = UIImage(named: "user")?.scale(scaledToWidth: 25)


        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2, vc3]
        tabBarController.tabBar.tintColor = UIColor.brand.primaryColor
        tabBarController.tabBar.unselectedItemTintColor = UIColor.gray
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
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
    }


}

