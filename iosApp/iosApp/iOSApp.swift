import SwiftUI

@main
struct iOSApp: App {
    @State private var isActive = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if isActive {
                    ContentView()
                        .transition(.opacity)
                } else {
                    SwiftUISplashScreen(isActive: $isActive)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: isActive)
        }
    }
}
