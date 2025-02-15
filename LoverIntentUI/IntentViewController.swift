//
//  IntentViewController.swift
//  LoverIntentUI
//
//  Created by udn on 2019/8/6.
//  Copyright © 2019 dengli. All rights reserved.
//

import IntentsUI
import FileKit

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
  
  @IBOutlet weak var loverImage: UIImageView!
  let appGroupsManager = AppGroupManager(appGroupId: "group.com.dengli.sirishortcut")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - INUIHostedViewControlling
  
  // Prepare your view controller for the interaction to handle.
  func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
    let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
    let desiredSize = CGSize(width: width, height: 300)
    
    if let image = appGroupsManager.getImageFromAppGroups() {
      DispatchQueue.main.async {
        self.loverImage.image = image
        self.loverImage.contentMode = .scaleAspectFill
      }
    }

    completion(true, parameters, desiredSize)
  }
  
}
