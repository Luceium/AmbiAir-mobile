package tech.luceium.ambiair

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform