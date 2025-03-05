package tech.luceium.ambiair.ui.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.text.ExperimentalTextApi
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontVariation
import androidx.compose.ui.text.font.FontWeight
import tech.luceium.ambiair.R

@OptIn(ExperimentalTextApi::class)
val MuseoModerno = FontFamily(
    Font(R.font.museo_moderno_variablefont_wght, variationSettings = FontVariation.Settings(
        FontVariation.weight(700),
        FontVariation.width(30f),
        FontVariation.slant(-6f),
    ))
)

@OptIn(ExperimentalTextApi::class)
val JosefinSans = FontFamily(
    Font(R.font.josefine_sans_variablefont_wght, variationSettings = FontVariation.Settings(
        FontVariation.weight(1000),
        FontVariation.width(30f),
        FontVariation.slant(-6f),
    ))
)

val displayFontFamily = MuseoModerno

val bodyFontFamily = JosefinSans

// Default Material 3 typography values
val baseline = Typography()

val AmbiAirTypography = Typography(
    displayLarge = baseline.displayLarge.copy(fontFamily = displayFontFamily),
    displayMedium = baseline.displayMedium.copy(fontFamily = displayFontFamily),
    displaySmall = baseline.displaySmall.copy(fontFamily = displayFontFamily),
    headlineLarge = baseline.headlineLarge.copy(fontFamily = displayFontFamily),
    headlineMedium = baseline.headlineMedium.copy(fontFamily = displayFontFamily),
    headlineSmall = baseline.headlineSmall.copy(fontFamily = displayFontFamily),
    titleLarge = baseline.titleLarge.copy(fontFamily = displayFontFamily),
    titleMedium = baseline.titleMedium.copy(fontFamily = displayFontFamily),
    titleSmall = baseline.titleSmall.copy(fontFamily = displayFontFamily),
    bodyLarge = baseline.bodyLarge.copy(fontFamily = bodyFontFamily),
    bodyMedium = baseline.bodyMedium.copy(fontFamily = bodyFontFamily),
    bodySmall = baseline.bodySmall.copy(fontFamily = bodyFontFamily),
    labelLarge = baseline.labelLarge.copy(fontFamily = bodyFontFamily),
    labelMedium = baseline.labelMedium.copy(fontFamily = bodyFontFamily),
    labelSmall = baseline.labelSmall.copy(fontFamily = bodyFontFamily),
)

