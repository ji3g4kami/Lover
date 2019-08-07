//
//  LoverIntentHandler.swift
//  LoverIntent
//
//  Created by udn on 2019/8/6.
//  Copyright © 2019 dengli. All rights reserved.
//

import Foundation

class LoverIntentHandler: NSObject, LoverIntentHandling {
  func handle(intent: LoverIntent, completion: @escaping (LoverIntentResponse) -> Void) {
    completion(LoverIntentResponse(code: .success, userActivity: nil))
  }
}
