import SwiftUI
import UIKit

struct LoginView: UIViewControllerRepresentable {
    var onDismiss: (() -> Void)?

    func makeUIViewController(context: Context) -> UIViewController {
        let controller = LoginViewController()
        controller.onDismiss = onDismiss
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

class LoginViewController: UIViewController {
    // UI Components
    private var logoImageView: UIImageView!
    private var logoTextImageView: UIImageView!
    private var taglineLabel: UILabel!
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var loginButton: UIButton!
    private var biometricsLabel: UILabel!
    private var checkboxView: UIView!
    private var activityIndicator: UIActivityIndicatorView!
    private var formStackView: UIStackView!
    private var dismissButton: UIButton!

    var onDismiss: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginScreen()
    }

    private func setupLoginScreen() {
        // Main view background
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        // Setup all UI components
        setupLogoAndTagline()
        setupFormStackView()
        setupBiometricsOption()
        setupActivityIndicator()
        setupDismissButton()
    }

    private func setupLogoAndTagline() {
        // Logo text image
        logoTextImageView = UIImageView(image: UIImage(named: "logo-text"))
        logoTextImageView.contentMode = .scaleAspectFit

        view.addSubview(logoTextImageView)
        logoTextImageView.translatesAutoresizingMaskIntoConstraints = false

        // Match the width of the form fields (50pt from each side)
        NSLayoutConstraint.activate([
            logoTextImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            logoTextImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65),
            logoTextImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65),
            logoTextImageView.heightAnchor.constraint(equalToConstant: 45)
        ])

        // Tagline label
        taglineLabel = UILabel()
        taglineLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        taglineLabel.font = UIFont(name: "JosefinSans-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24)
        taglineLabel.numberOfLines = 2
        taglineLabel.lineBreakMode = .byWordWrapping
        taglineLabel.textAlignment = .center
        taglineLabel.text = "Save your wallet\nSave the planet"

        // Add line spacing with attributed string
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: taglineLabel.font!
        ]
        taglineLabel.attributedText = NSAttributedString(string: "Save your wallet\nSave the planet", attributes: attributes)

        view.addSubview(taglineLabel)
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taglineLabel.topAnchor.constraint(equalTo: logoTextImageView.bottomAnchor, constant: 25),
            taglineLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            taglineLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            taglineLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    private func setupFormStackView() {
        // Create form container stack view
        formStackView = UIStackView()
        formStackView.axis = .vertical
        formStackView.spacing = 20
        formStackView.alignment = .fill
        formStackView.distribution = .fill

        view.addSubview(formStackView)
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            formStackView.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 70),
            formStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            formStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])

        // Email field
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.returnKeyType = .next
        emailTextField.delegate = self

        // Add left padding to text field
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        emailTextField.leftView = emailPaddingView
        emailTextField.leftViewMode = .always

        // Password field
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.delegate = self

        // Add left padding to text field
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always

        // Add show/hide password button
        let showHideButton = UIButton(type: .custom)
        showHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showHideButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        showHideButton.tintColor = .gray
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        let passwordRightView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        passwordRightView.addSubview(showHideButton)
        showHideButton.center = passwordRightView.center

        passwordTextField.rightView = passwordRightView
        passwordTextField.rightViewMode = .always

        // Login button
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1.0)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        // Add all elements to stack view
        formStackView.addArrangedSubview(emailTextField)
        formStackView.addArrangedSubview(passwordTextField)
        formStackView.addArrangedSubview(loginButton)

        // Set height constraints for text fields
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupBiometricsOption() {
        // Create horizontal stack view for checkbox and label
        let biometricsStackView = UIStackView()
        biometricsStackView.axis = .horizontal
        biometricsStackView.spacing = 10
        biometricsStackView.alignment = .center

        view.addSubview(biometricsStackView)
        biometricsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            biometricsStackView.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 30),
            biometricsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Checkbox view
        checkboxView = UIView()
        checkboxView.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        checkboxView.layer.cornerRadius = 3

        // Add tap gesture to checkbox
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleCheckbox))
        checkboxView.addGestureRecognizer(tapGesture)
        checkboxView.isUserInteractionEnabled = true

        // Biometrics label
        biometricsLabel = UILabel()
        biometricsLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        biometricsLabel.font = UIFont(name: "Inter-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)
        biometricsLabel.text = "Enable biometrics for faster log in"

        // Add to stack view
        biometricsStackView.addArrangedSubview(checkboxView)
        biometricsStackView.addArrangedSubview(biometricsLabel)

        // Set size constraints for checkbox
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkboxView.widthAnchor.constraint(equalToConstant: 16),
            checkboxView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray

        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 80)
        ])
    }

    private func setupDismissButton() {
        dismissButton = UIButton(type: .system)
        dismissButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        dismissButton.tintColor = .gray
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)

        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            dismissButton.widthAnchor.constraint(equalToConstant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()

        // Update button image
        if passwordTextField.isSecureTextEntry {
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }

    @objc private func toggleCheckbox(_ sender: UITapGestureRecognizer) {
        if let checkboxView = sender.view {
            // Toggle checkbox state
            let isChecked = checkboxView.backgroundColor == UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
            checkboxView.backgroundColor = isChecked ?
                UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1.0) :
                UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)

            // Add checkmark when selected
            if !isChecked {
                let checkmark = UIImageView(image: UIImage(systemName: "checkmark"))
                checkmark.tintColor = .white
                checkmark.tag = 100
                checkmark.contentMode = .scaleAspectFit
                checkboxView.addSubview(checkmark)
                checkmark.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    checkmark.centerXAnchor.constraint(equalTo: checkboxView.centerXAnchor),
                    checkmark.centerYAnchor.constraint(equalTo: checkboxView.centerYAnchor),
                    checkmark.widthAnchor.constraint(equalTo: checkboxView.widthAnchor, multiplier: 0.7),
                    checkmark.heightAnchor.constraint(equalTo: checkboxView.heightAnchor, multiplier: 0.7)
                ])
            } else {
                // Remove checkmark
                checkboxView.viewWithTag(100)?.removeFromSuperview()
            }
        }
    }

    @objc private func loginButtonTapped() {
        // Show loading indicator
        activityIndicator.startAnimating()
        loginButton.isEnabled = false

        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }

            self.activityIndicator.stopAnimating()
            self.loginButton.isEnabled = true

            // Validate inputs
            guard let email = self.emailTextField.text, !email.isEmpty,
                  let password = self.passwordTextField.text, !password.isEmpty else {
                self.showAlert(title: "Error", message: "Please enter both email and password")
                return
            }

            // Here you would normally authenticate with your backend
            print("Login attempt with email: \(email)")

            // Show success message
            self.showAlert(title: "Success", message: "Login successful!")
        }
    }

    @objc private func dismissButtonTapped() {
        if let onDismiss = onDismiss {
            onDismiss()
        } else {
            dismiss(animated: true)
        }
    }

    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            loginButtonTapped()
        }
        return true
    }
}

// SwiftUI wrapper for preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(onDismiss: {})
            .edgesIgnoringSafeArea(.all)
    }
}
