# 🖥️ Ubuntu Terminal for Flutter

[![Pub Version](https://img.shields.io/pub/v/ubunutu_terminal.svg)](https://pub.dev/packages/ubunutu_terminal)
[![Build Status](https://github.com/rohankarn35/ubunutu_terminal/workflows/CI/badge.svg)](https://github.com/rohankarn35/ubunutu_terminal/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter Platform](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev)
[![Likes](https://img.shields.io/pub/likes/ubunutu_terminal?style=flat-square)](https://pub.dev/packages/ubunutu_terminal)

<div align="center">
  <img src="![alt text](https://github.com/rohankarn35/ubunutu_terminal/blob/main/image.png)" alt="Ubuntu Terminal Preview" width="600"/>
  
  *A sleek, customizable Ubuntu-style terminal emulator for Flutter applications*
</div>

---

## ✨ Features

<table>
  <tr>
    <td>
      <h3>Core Features</h3>
      <ul>
        <li>🎯 Ubuntu-inspired terminal interface</li>
        <li>💻 Customizable command prompt</li>
        <li>🔍 User-defined commands and responses</li>
        <li>📜 Command history tracking</li>
      </ul>
    </td>
    <td>
      <h3>UI Features</h3>
      <ul>
        <li>🎨 Classic Ubuntu terminal theme</li>
        <li>📱 Responsive design</li>
        <li>🖥️ Window control buttons</li>
        <li>⌨️ Smart input focus management</li>
      </ul>
    </td>
  </tr>
</table>

## 🚀 Quick Start

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  ubunutu_terminal: ^0.1.0
```

Run:

```bash
flutter pub get
```

### Basic Implementation

```dart
import 'package:flutter/material.dart';
import 'package:ubunutu_terminal/ubunutu_terminal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final commands = {
      'hello': '👋 Hello, Terminal User!',
      'date': '📅 ${DateTime.now()}',
      'help': '''
📚 Available Commands:
  • hello - Greet the user
  • date  - Show current date/time
  • help  - Display this help
  • clear - Clear terminal
''',
    };

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: TerminalPage(
          terminalPrompt: 'user@ubuntu',
          commands: commands,
        ),
      ),
    );
  }
}
```

## 🛠️ Advanced Usage

### Custom Command Configuration

Create rich terminal experiences with custom commands:

```dart
final Map<String, String> commands = {
  'welcome': '''
    ╔════════════════════════════════╗
    ║  Welcome to Ubuntu Terminal!   ║
    ║  Type 'help' to get started   ║
    ╚════════════════════════════════╝
  ''',
  'system': '''
    OS: Ubuntu Terminal Emulator
    Version: 1.0.0
    Flutter: ${Theme.of(context).platform}
  ''',
  'time': '🕒 ${DateTime.now().toLocal()}',
  'help': '''
    📋 Command List:
    • welcome - Show welcome message
    • system  - Display system info
    • time    - Show current time
    • clear   - Clear terminal
  '''
};
```

## 📐 Space Requirements & Responsiveness

The terminal automatically adapts to different screen sizes while maintaining optimal usability:

```
Minimum Requirements:
└── Width:  400px
└── Height: 300px

Recommended:
└── Width:  80% of screen width
└── Height: 80% of screen height
```

### Scaling Factors

```dart
// Automatically adjusts to screen size
_widthFactor = 0.8;   // 80% width
_heightFactor = 0.8;  // 80% height
```

## 🔜 Upcoming Features

- ⌨️ Command history navigation (↑/↓ arrows)
- 📋 Copy/paste functionality
- 🔍 Text selection support
- 📝 Command auto-completion
- ⚡ Keyboard shortcuts
- 🔄 Configurable buffer size

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. 🍴 Fork the repository
2. 🌿 Create your feature branch (`git checkout -b feature/amazing-feature`)
3. 💻 Code your magic
4. 📝 Commit changes (`git commit -m 'Add amazing feature'`)
5. 🚀 Push to the branch (`git push origin feature/amazing-feature`)
6. 🔍 Open a Pull Request

## 📜 License

Licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Rohan Karn**

- GitHub: [@rohankarn35](https://github.com/rohankarn35)
- LinkedIn: [Connect with me](https://linkedin.com/in/yourprofile)

## ❤️ Support

If you find this package helpful:

- ⭐ Star the repository
- 🐛 Report bugs via [issues](https://github.com/rohankarn35/ubunutu_terminal/issues)
- 💡 Suggest features
- 🔀 Submit pull requests

---

<div align="center">
  <i>Built with ❤️ by Rohan Karn</i>
</div>
