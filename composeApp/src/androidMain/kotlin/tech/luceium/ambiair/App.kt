package tech.luceium.ambiair

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import org.jetbrains.compose.resources.painterResource
import org.jetbrains.compose.ui.tooling.preview.Preview

import ambiair.composeapp.generated.resources.Res
import ambiair.composeapp.generated.resources.compose_multiplatform
import androidx.compose.animation.core.copy
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun App() {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 30.dp)
    ) {
        // ambiair TextView
        Text(
            text = stringResource(id = R.string.app_name),
            style = MaterialTheme.typography.headlineLarge.copy(
                fontFamily = FontFamily.MuseoModerno, // Replace with MuseoModerno if you have it
                fontSize = 64.sp,
                lineHeight = 102.sp,
                textAlign = TextAlign.Center
            ),
            modifier = Modifier
                .fillMaxWidth()
                .height(102.dp)
                .offset(y = 93.dp)
        )

        // Save your wallet TextView
        Text(
            text = stringResource(id = R.string.save_your_w),
            style = MaterialTheme.typography.headlineSmall.copy(
                fontFamily = FontFamily.SansSerif, // Replace with Josefin Sans if you have it
                fontSize = 24.sp,
                lineHeight = 24.sp,
                color = Color.Black,
                textAlign = TextAlign.Center
            ),
            modifier = Modifier
                .fillMaxWidth()
                .height(48.dp)
                .offset(y = 192.dp)
        )

        // auth View (Placeholder)
        Box(
            modifier = Modifier
                .width(290.dp)
                .height(222.dp)
                .offset(x = 22.dp, y = 315.dp) // Adjusted offset
                .background(Color.Transparent) // Replace with your actual content
        ) {
            // Add your content for the auth view here
            Text(
                text = "Auth View",
                style = TextStyle(
                    color = Color.Gray,
                    fontSize = 16.sp,
                    fontWeight = FontWeight.Bold
                ),
                modifier = Modifier.align(Alignment.Center)
            )
        }

        // Enable biometrics TextView
        Text(
            text = stringResource(id = R.string.enable_biom),
            style = MaterialTheme.typography.bodySmall.copy(
                fontFamily = FontFamily.SansSerif, // Replace with Inter if you have it
                fontSize = 12.sp,
                lineHeight = 15.sp,
                color = Color.Black,
                textAlign = TextAlign.Start
            ),
            modifier = Modifier
                .width(197.dp)
                .height(30.dp)
                .offset(x = 104.dp, y = 551.dp) // Adjusted offset
        )

        // rectangle_4 View
        Box(
            modifier = Modifier
                .width(16.dp)
                .height(15.dp)
                .offset(x = 82.dp, y = 551.dp) // Adjusted offset
                .background(Color(0xFFD9D9D9))
        )
    }
}

@Preview(showBackground = true)
@Composable
fun AppPreview() {
    App()
}