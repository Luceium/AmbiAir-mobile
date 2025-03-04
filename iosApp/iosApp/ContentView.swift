import SwiftUI
import Shared

struct ContentView: View {
    @State private var showContent = false
    @State private var showLoginView = false

    var body: some View {
        NavigationView {
            VStack {
                Button("Click me!") {
                    withAnimation {
                        showContent = !showContent
                    }
                }

                if showContent {
                    VStack(spacing: 16) {
                        Image(systemName: "swift")
                            .font(.system(size: 200))
                            .foregroundColor(.accentColor)
                        Text("SwiftUI: \(Greeting().greet())")
                    }
                    .transition(.move(edge: .top).combined(with: .opacity))
                }

                Spacer()

                Button("Show Login Page") {
                    showLoginView = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .fullScreenCover(isPresented: $showLoginView) {
                LoginView(onDismiss: {
                    showLoginView = false
                })
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
