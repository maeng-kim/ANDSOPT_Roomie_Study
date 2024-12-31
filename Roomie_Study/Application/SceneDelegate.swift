//
//  SceneDelegate.swift
//  Roomie_Study
//
//  Created by MaengKim on 12/31/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
      window?.windowScene = windowScene
    let viewController = ViewController()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
}
