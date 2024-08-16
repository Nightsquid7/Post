import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let first = NSApplication.shared.windows.first {
            if let contentVC =  first.contentViewController {
                guard CommandLine.arguments.count > 1 else { return }
                let arguments = CommandLine.arguments[1...].joined(separator: "\n\n")

                let textField = NSTextField(frame: .init(x: 0, y: 0, width: 100, height: 100))
                textField.font = NSFont(name: "Public Pixel", size: 16)

                textField.stringValue = arguments
                textField.textColor = .black
                textField.isEditable = false
                contentVC.view = textField

                NSLayoutConstraint.activate([
                    contentVC.view.heightAnchor.constraint(greaterThanOrEqualToConstant: 300),
                    contentVC.view.widthAnchor.constraint(greaterThanOrEqualToConstant: 500),
                ])
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

