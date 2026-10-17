#!/usr/bin/env bash
set -e

echo "=================================================="
echo "  RANIYA KAZI PORTFOLIO: VERCEL BUILD SCRIPT     "
echo "  Target: Flutter Web (CanvasKit / HTML)         "
echo "=================================================="

# 1. Check if Flutter SDK is available in the runner PATH
if command -v flutter &> /dev/null; then
    echo "Found Flutter SDK in system PATH:"
    flutter --version | head -n 2
    echo "Resolving Flutter packages..."
    flutter pub get
    echo "Compiling Flutter Web release bundle..."
    flutter build web --release
elif [ -f "build/web/index.html" ] && [ -f "build/web/main.dart.js" ]; then
    echo "Flutter SDK not detected in runner environment."
    echo "Found verified pre-compiled Flutter Web distribution in build/web/:"
    ls -lh build/web/index.html build/web/main.dart.js
    echo "Proceeding with committed production web distribution."
else
    echo "Flutter SDK not found and pre-compiled bundle not present."
    echo "Installing Flutter SDK (stable channel, shallow clone)..."
    git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$HOME/flutter-sdk"
    export PATH="$HOME/flutter-sdk/bin:$PATH"
    flutter --version | head -n 2
    flutter config --no-analytics
    echo "Resolving Flutter packages..."
    flutter pub get
    echo "Compiling Flutter Web release bundle..."
    flutter build web --release
fi

if [ -f "build/web/index.html" ]; then
    echo "=================================================="
    echo "  BUILD SUCCESS: build/web/index.html is ready!   "
    echo "=================================================="
else
    echo "ERROR: build/web/index.html was not found or failed to compile."
    exit 1
fi
