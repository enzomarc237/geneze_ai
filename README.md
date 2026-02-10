# Geneze - AI Writing Assistant (macOS)

Geneze is a native macOS application built with Flutter, designed to assist writers with AI-powered suggestions while providing a robust Markdown editing experience.

## Architecture

This project follows a **Feature-First Architecture** combined with **Clean Architecture** principles.

### Folder Structure

```
lib/
├── app/                 # Application entry point and configuration
├── core/                # Core utilities, DI, and shared services
├── features/            # Feature-based modules
│   ├── ai_assistant/    # AI integration logic and UI
│   └── editor/          # Markdown editor and preview logic
├── shared/              # Shared UI components
└── main.dart            # Main entry point
```

### State Management

We use **BLoC (Business Logic Component)** for state management to separate business logic from UI.

*   `flutter_bloc`: For the BLoC pattern.
*   `equatable`: For value equality in states and events.
*   `get_it`: For dependency injection.

## Prerequisites

*   Flutter SDK (latest stable)
*   macOS development environment (Xcode)
*   CocoaPods

## How to Run

1.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

2.  **Enable macOS desktop support** (if not already enabled):
    ```bash
    flutter config --enable-macos-desktop
    ```

3.  **Run the app**:
    ```bash
    flutter run -d macos
    ```

## Key Libraries

*   `macos_ui`: Provides native macOS widgets and look-and-feel.
*   `flutter_markdown`: Renders Markdown content.
*   `dio`: HTTP client for AI API calls.
