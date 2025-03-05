package tech.luceium.ambiair

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.size
import androidx.compose.material.Divider
import androidx.compose.material.OutlinedTextField
import androidx.compose.material3.Button
import androidx.compose.material3.Checkbox
import androidx.compose.material3.InputChip
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import tech.luceium.ambiair.ui.theme.AmbiAirTheme
import tech.luceium.ambiair.ui.theme.AmbiAirTypography
import tech.luceium.ambiair.ui.theme.JosefinSans
import tech.luceium.ambiair.ui.theme.extendedDark

@Composable
fun App() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 30.dp, vertical = 100.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // ambiair TextView
        Text(
            text = stringResource(id = R.string.app_name),
            style = AmbiAirTypography.headlineLarge.copy(
                fontWeight = FontWeight.Normal,
                fontSize = 80.sp,
                lineHeight = 102.sp,
                textAlign = TextAlign.Center,
                brush = Brush.linearGradient(
                    colors = listOf(extendedDark.cold.color, extendedDark.cool.color, extendedDark.warm.color, extendedDark.hot.color)
                )
            ),
            modifier = Modifier
                .fillMaxWidth()
        )

        // Save your wallet TextView
        Text(
            text = "Save your wallet\nSave the planet",
            style = AmbiAirTypography.headlineSmall.copy(
                fontFamily = JosefinSans,
                fontWeight = FontWeight.Medium,
                fontSize = 32.sp,
                lineHeight = 32.sp,
                color = Color.Black,
                textAlign = TextAlign.Center
            ),
            modifier = Modifier
                .fillMaxWidth()
        )

        Spacer(modifier = Modifier.size(64.dp))

        Column {
            OutlinedTextField("test", onValueChange = {_ -> Unit}, label = { Text("Username") }, modifier = Modifier.fillMaxWidth())
            Spacer(Modifier.size(16.dp))
            OutlinedTextField("test", onValueChange = {_ -> Unit}, label = { Text("Password") }, modifier = Modifier.fillMaxWidth())
//            Spacer(Modifier.size(5.dp))
            Row (verticalAlignment = Alignment.CenterVertically) {
                Checkbox(checked = false, onCheckedChange = {})
                Text(
                    text = "Enable biometrics for next log in",
                    style = AmbiAirTypography.bodySmall.copy(
                        fontSize = 16.sp,
                        lineHeight = 16.sp,
                        color = Color.Black,
                        textAlign = TextAlign.Start
                    )
                )
            }
            Button(onClick = { println("Log In Clicked") }) { Text("Log In") }
            Spacer(Modifier.size(16.dp))
            Divider()
            Spacer(Modifier.size(16.dp))
            Text("Sign in with Google")
        }

        // Enable biometrics TextView


    }
}

@Preview(showBackground = true)
@Composable
fun AppPreview() {
    AmbiAirTheme {
        App()
    }
}