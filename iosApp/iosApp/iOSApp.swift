import SwiftUI

@main
struct iOSApp: App {
    @State private var isActive = false

    var body: some Scene {
        WindowGroup {
            if isActive {
                ContentView()
            } else {
                SwiftUISplashScreen(isActive: $isActive)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
