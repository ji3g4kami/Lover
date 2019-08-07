//
//  AppGroupsManager.swift
//  mySiri
//
//  Created by udn on 2019/8/6.
//  Copyright © 2019 dengli. All rights reserved.
//

import Foundation

public enum TTSFileError: Error {
  case fileCreationError
  case folderCreationError
  case containerNotExistError
}

public final class AppGroupManager: FileManagerProtocol {
  
  // MARK: - Properties
  
  let fileManager = FileManager.default
  
  /// AppGroups Id. e.g. "group.com.dengli.AudioCast"
  public let identifier: String

  
  /// Root Path of AppGroups container
  public lazy var containerPath: String = {
    guard let storageURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: identifier) else {
      fatalError(TTSFileError.containerNotExistError.localizedDescription)
    }
    return storageURL.path
  }()
  
  // MARK: - Instantiation
  /// During the instantation process, sub-folders will be created if not exist yet.
  public init(appGroupId: String) {
    self.identifier = appGroupId
  }
  
  public func saveImageToAppGroups(_ chosenImage: UIImage) {
    let path = createPath(fileName: "girl.png")
    let url = URL(fileURLWithPath: path)
    print(path)
    try? FileManager.default.removeItem(at: url)
    do {
      try chosenImage.pngData()?.write(to: url)
    } catch {
      debugPrint(error.localizedDescription)
    }
  }
  
  public func getImageFromAppGroups() -> UIImage? {
    let path = createPath(fileName: "girl.png")
    return UIImage(contentsOfFile: path)
  }
}
