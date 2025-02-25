package tech.luceium.ambiair

interface Biometrics {
    fun authenticate(onSuccess: () -> Unit, onError: () -> Unit): Unit
}