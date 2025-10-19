#!/bin/bash

# Brand Ambassador Flutter - Setup Script
echo "🚀 Setting up Brand Ambassador Flutter project..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter is installed"

# Get Flutter dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

# Generate code
echo "🔧 Generating code..."
flutter packages pub run build_runner build --delete-conflicting-outputs

if [ $? -eq 0 ]; then
    echo "✅ Code generation completed"
else
    echo "⚠️  Code generation had issues (this is normal for initial setup)"
fi

# Check Flutter doctor
echo "🏥 Running Flutter doctor..."
flutter doctor

echo ""
echo "🎉 Setup completed!"
echo ""
echo "📋 Next steps:"
echo "1. Run 'flutter run' to start the app"
echo "2. Follow the DEVELOPMENT_ROADMAP.md for screen development"
echo "3. Start with the 'Influencer Login Screen' as the next priority"
echo ""
echo "📚 Documentation:"
echo "- README.md - Project overview and setup"
echo "- DEVELOPMENT_ROADMAP.md - Screen development priorities"
echo "- PROJECT_SUMMARY.md - Complete project summary"
echo ""
echo "Happy coding! 🚀"
