import SwiftUI

struct SwiftUISplashScreen: View {
    @Binding var isActive: Bool
    @State private var opacity: Double = 1.0

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 247, height: 243)

                Image("logo-text")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            }
        }
        .opacity(opacity)
        .onAppear {
            // Use a safer transition with animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.opacity = 0
                }

                // Set isActive after animation completes
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SwiftUISplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISplashScreen(isActive: .constant(false))
    }
}
