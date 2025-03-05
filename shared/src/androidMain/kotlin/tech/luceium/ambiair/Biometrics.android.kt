package tech.luceium.ambiair
import androidx.biometric.BiometricManager.Authenticators.BIOMETRIC_STRONG
import androidx.biometric.BiometricManager.Authenticators.BIOMETRIC_WEAK
import androidx.biometric.BiometricPrompt

class AndroidBiometrics : Biometrics {
    override fun authenticate(onSuccess: () -> Unit, onError: () -> Unit) {
        // Check if user selected the option to use biometric authentication
        // TODO: Check if biometric authentication is available on the device

        // Handle normal log in with credential manager
        // TODO: Handle normal log in with credential manager

        val promptInfo = BiometricPrompt.PromptInfo.Builder()
            .setTitle("Biometric Login")
            .setSubtitle("Log in using your biometric credential")
            .setAllowedAuthenticators(BIOMETRIC_STRONG or BIOMETRIC_WEAK)
            .build()
    }
}