package com.example.dlbm.ui.components

import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.example.dlbm.R
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Face
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.Person
import androidx.compose.material.icons.filled.ShoppingCart
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector


data class NavigationBarItem(
    val route: String,
    val icon: ImageVector,
    val title: String
)


@Composable
fun SootheBottomNavigation(
    selectedItem: String,
    onItemSelected: (String) -> Unit,
    items: List<NavigationBarItem>
) {
    NavigationBar(
        modifier = Modifier,
    ) {
        items.forEach { item ->
            NavigationBarItem(
                icon = { Icon(item.icon, contentDescription = item.title) },
                label = { Text(item.title) },
                selected = item.route == selectedItem,
                onClick = { onItemSelected(item.route) }
            )
        }
    }
}


@Preview
@Composable
private fun SootheBottomNavigationPreview() {
    SootheBottomNavigation(
        selectedItem = "home",
        onItemSelected = { },
        items = listOf(
            NavigationBarItem(
                route = "home",
                icon = Icons.Default.Home,
                title = stringResource(R.string.bottom_navigation_home)
            ),
            NavigationBarItem(
                route = "toolbox",
                icon = Icons.Default.Face,
                title = stringResource(R.string.bottom_navigation_toolbox)
            ),
            NavigationBarItem(
                route = "price",
                icon = Icons.Default.ShoppingCart,
                title = stringResource(R.string.bottom_navigation_price)
            ), NavigationBarItem(
                route = "user",
                icon = Icons.Default.Person,
                title = stringResource(R.string.bottom_navigation_user)
            )
        )
    )
}