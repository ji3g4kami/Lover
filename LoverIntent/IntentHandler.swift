//
//  IntentHandler.swift
//  LoverIntent
//
//  Created by udn on 2019/8/6.
//  Copyright © 2019 dengli. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return LoverIntentHandler()
    }
    
}
