# Project: Food Donation App

**Purpose:** Facilitate food donations and distribution, connecting donors with recipients.

**Current Features:**
*   User authentication (login, registration).
*   Separate registration flows for donors and recipients.
*   Basic UI for login with a carved header.
*   Pill-shaped navigation bar for main screens.
*   Placeholder pages for donor/recipient home, map, profile, settings, chat history, chat screen, and find donors.

**Current Requested Change Plan:**

1.  **Update `pubspec.yaml`**: Add `image_picker` and `font_awesome_flutter` (if not already present and updated) for profile picture upload and Google logo. (Already done)
2.  **Create `forgot_password_screen.dart`**: Implement a new screen for password reset functionality, including email input, OTP sending, and password reset.
3.  **Modify `login_screen.dart`**:
    *   Add navigation to `forgot_password_screen.dart` when "Forgot Password?" is tapped.
    *   Integrate Google logo into "Sign in with Google" button.
    *   Ensure the carved header is correctly applied.
    *   Add a placeholder for displaying an uploaded profile picture in the header.
4.  **Modify `account_type_selection_screen.dart`**: Apply the carved header.
5.  **Modify `donor_registration_screen.dart` and `recipient_registration_screen.dart`**:
    *   Apply the carved header to the forms.
    *   Add functionality to upload a profile picture.
    *   Add a placeholder for displaying the uploaded profile picture in the header.
6.  **Modify `curved_header.dart`**: Adjust the `CurvedHeader` widget to optionally display a profile picture and title, making it reusable for different pages.
7.  **Modify `main.dart`**:
    *   Ensure all new routes are registered (if using named routes or `go_router`).
    *   Remove the debug badge by setting `debugShowCheckedModeBanner: false`.
    *   Ensure responsiveness across the entire application by using appropriate widgets (e.g., `MediaQuery`, `LayoutBuilder`, `SingleChildScrollView`, `Expanded`, `Flexible`) and responsive layouts.
8.  **Refactor for Responsiveness**: Review all existing screens (`login_screen.dart`, `account_type_selection_screen.dart`, `donor_home_page.dart`, `donor_main_screen.dart`, `donor_map_page.dart`, `donor_profile_page.dart`, `donor_settings_page.dart`, `recipient_home_page.dart`, `recipient_main_screen.dart`, `recipient_map_page.dart`, `recipient_profile_page.dart`, `recipient_settings_page.dart`, `chat_history_page.dart`, `chat_screen.dart`, `find_donors_page.dart`, `curved_header.dart`, `pill_shaped_nav_bar.dart`, and the new screens) to ensure they are responsive. This includes:
    *   Using `Padding` and `SizedBox` with relative values or `Expanded`/`Flexible` where necessary.
    *   Wrapping content in `SingleChildScrollView` for scrollability on smaller screens.
    *   Using `MediaQuery.of(context).size` to adapt UI elements.
