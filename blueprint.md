# Project Blueprint

## Overview

This document outlines the style, design, and features of the Flutter application. It serves as a single source of truth for the project's current state and future development plans.

## Style and Design

The application uses a modern and clean design, with a consistent color scheme and typography. The UI is built using Flutter's Material Design components, with custom styles for a unique look and feel.

*   **Color Scheme:** The primary color is a deep purple, with a light and dark theme available.
*   **Typography:** The app uses the Oswald, Roboto, and Open Sans fonts from Google Fonts for a clean and readable text style.
*   **Layout:** The layout is designed to be responsive and adapt to different screen sizes, ensuring a great user experience on both mobile and web.

## Implemented Features

*   User authentication (Login and Registration)
*   Google Sign-In
*   Separate dashboards for Donors and Recipients
*   Account type selection
*   Curved header design on the login screen
*   Pill-shaped navigation bar for the main screens

## Current Task: UI Enhancements and Forgot Password

The current task is to enhance the UI by adding a carved header to more screens, implementing a profile picture upload feature, improving the Google sign-in button, and making the app fully responsive. Additionally, a "Forgot Password" feature will be implemented.

### Plan:

1.  **Add Dependencies:**
    *   Add `image_picker` for selecting a profile picture.
    *   Add `font_awesome_flutter` for the Google logo.
2.  **Create Forgot Password Screen:**
    *   Create a new screen with an email input field and a "Send OTP" button.
3.  **Update UI:**
    *   Add the carved header to the account type selection and registration screens.
    *   Add a profile picture upload option to the registration forms.
    *   Display the uploaded profile picture in the header of the login and registration screens.
    *   Add the Google logo to the "Sign In with Google" button.
4.  **Responsiveness:**
    *   Ensure all screens are responsive and adapt to different screen sizes.
5.  **Final Touches:**
    *   Remove the debug badge from the `MaterialApp`.
