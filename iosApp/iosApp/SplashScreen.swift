import SwiftUI
import UIKit

struct SplashScreen: UIViewControllerRepresentable {
    @Binding var isActive: Bool

    func makeUIViewController(context: Context) -> UIViewController {
        return SplashViewController(isActive: $isActive)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

class SplashViewController: UIViewController {
    private var isActive: Binding<Bool>
    private var logoImageView: UIImageView!
    private var mainView: UIView!

    init(isActive: Binding<Bool>) {
        self.isActive = isActive
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSplashScreen()

        // Fade out splash screen after 1.5 seconds, then transition
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.alpha = 0
            }, completion: { _ in
                // Set isActive after animation completes
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.isActive.wrappedValue = true
                }
            })
        }
    }

    private func setupSplashScreen() {
        // Main view
        mainView = UIView()
        mainView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        mainView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.addSubview(mainView)

        // Logo image view
        logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        let logoWidth: CGFloat = 247
        let logoHeight: CGFloat = 243
        logoImageView.frame = CGRect(
            x: (mainView.frame.width - logoWidth) / 2,
            y: (mainView.frame.height - logoHeight) / 2,
            width: logoWidth,
            height: logoHeight
        )
        mainView.addSubview(logoImageView)
    }
}
