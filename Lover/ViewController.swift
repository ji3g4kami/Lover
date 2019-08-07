
import FileKit
import UIKit
import Intents
import IntentsUI

class ViewController: UIViewController {

  
  @IBOutlet weak var choosedImage: UIImageView!
  let appGroupsManager = AppGroupManager(appGroupId: "group.com.dengli.sirishortcut")
  let siriButton = INUIAddVoiceShortcutButton(style: .whiteOutline)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let image = appGroupsManager.getImageFromAppGroups() {
      choosedImage.image = image
    }
    addSiriButton(to: view)
  }
  
  func addSiriButton(to view: UIView) {
    siriButton.translatesAutoresizingMaskIntoConstraints = false
    
    let intent = LoverIntent()
    intent.suggestedInvocationPhrase = "The most beautifil woman on earth"
    siriButton.shortcut = INShortcut(intent: intent)
    
    // shortcut delegations
    siriButton.delegate = self
    view.addSubview(siriButton)
    view.centerXAnchor.constraint(equalTo: siriButton.centerXAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo: siriButton.bottomAnchor, constant: 30).isActive = true
  }
  
  
  @IBAction func chooseImage(_ sender: Any) {
    let pickerController = UIImagePickerController()
    pickerController.sourceType = .photoLibrary
    pickerController.allowsEditing = true
    pickerController.delegate = self
    present(pickerController, animated: true, completion: nil)
  }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
      let orientationFixedImage = image.upOrientationImage {
        choosedImage.image = orientationFixedImage
        appGroupsManager.saveImageToAppGroups(orientationFixedImage)
    }
    dismiss(animated: true, completion: nil)
  }
}

extension ViewController: INUIAddVoiceShortcutViewControllerDelegate {
  func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
}


extension ViewController: INUIAddVoiceShortcutButtonDelegate {
  func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
    addVoiceShortcutViewController.delegate = self
    addVoiceShortcutViewController.modalPresentationStyle = .formSheet
    present(addVoiceShortcutViewController, animated: true, completion: nil)
  }
  
  func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
    editVoiceShortcutViewController.delegate = self
    editVoiceShortcutViewController.modalPresentationStyle = .formSheet
    present(editVoiceShortcutViewController, animated: true, completion: nil)
  }
}


extension ViewController: INUIEditVoiceShortcutViewControllerDelegate {
  func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
  
}
