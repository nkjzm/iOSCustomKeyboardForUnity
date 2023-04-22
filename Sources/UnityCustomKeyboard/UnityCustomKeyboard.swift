import UIKit

@_cdecl("CustomizeKeyboardReturnKey")
public func customizeKeyboardReturnKey(_ returnKeyType: UnsafePointer<CChar>)  {
    return UnityCustomKeyboard.customizeKeyboardReturnKey(returnKeyType: returnKeyType)
}

public class UnityCustomKeyboard {
    public static func customizeKeyboardReturnKey(returnKeyType: UnsafePointer<CChar>) {
        let returnKeyTypeString = String(cString: returnKeyType)
        
        var newReturnKeyType: UIReturnKeyType
        
        switch returnKeyTypeString {
        case "Default":
            newReturnKeyType = .default
        case "Go":
            newReturnKeyType = .go
        case "Google":
            newReturnKeyType = .google
        case "Join":
            newReturnKeyType = .join
        case "Next":
            newReturnKeyType = .next
        case "Route":
            newReturnKeyType = .route
        case "Search":
            newReturnKeyType = .search
        case "Send":
            newReturnKeyType = .send
        case "Yahoo":
            newReturnKeyType = .yahoo
        case "Done":
            newReturnKeyType = .done
        case "EmergencyCall":
            newReturnKeyType = .emergencyCall
        default:
            return // Unsupported return key type
        }
        
        waitForFirstResponderAndUpdate(newReturnKeyType: newReturnKeyType)
  }

    
  static  func waitForFirstResponderAndUpdate(newReturnKeyType: UIReturnKeyType, retries: Int = 3) {
        let keyWindow = UIApplication.shared.keyWindow
        let rootView = keyWindow?.rootViewController?.view
        let firstResponder = findFirstResponder(in: rootView)
            
        if let textField = firstResponder as? UITextField {
            textField.returnKeyType = newReturnKeyType
            textField.reloadInputViews()
        } else if let textView = firstResponder as? UITextView {
            textView.returnKeyType = newReturnKeyType
            textView.reloadInputViews()
        } else if retries > 0 {
            // レスポンダが見つからない場合、0.1秒後に再度実行します
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.waitForFirstResponderAndUpdate(newReturnKeyType: newReturnKeyType, retries: retries - 1)
            }
        } else {
            // 最大試行回数に達した場合、処理を終了します
            print("Failed to find first responder after \(retries) retries.")
        }
    }
    
    static func findFirstResponder(in view: UIView?) -> UIResponder? {
        guard let view = view else { return nil }

        if view.isFirstResponder {
            return view
        }

        for subview in view.subviews {
            if let firstResponder = findFirstResponder(in: subview) {
                return firstResponder
            }
        }

        return nil
    }
}
