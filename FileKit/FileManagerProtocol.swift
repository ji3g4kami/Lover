//
//  TTSFileManagerProtocol.swift
//  mySiri
//
//  Created by udn on 2019/8/6.
//  Copyright © 2019 dengli. All rights reserved.
//

import Foundation

public protocol FileManagerProtocol {
  var containerPath: String { get }
}

extension FileManagerProtocol {
  /// Get the path to a file under a sub-folder inside AppGroups
  /// - Parameters:
  ///   - folderName: such as "TTS".
  ///   - fileName: such as "1234567.mp3"
  public func createPath(fileName: String) -> String {
    return containerPath + "/\(fileName)"
  }
  
  public func fileExists(at path: String) -> Bool {
    return FileManager.default.fileExists(atPath: path)
  }
  

}
