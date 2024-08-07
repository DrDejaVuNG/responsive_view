## ResponsiveView - A Flutter package for responsive layouts

This package provides a convenient way to handle responsive layouts in your Flutter applications. It allows you to scale UI elements based on the device screen size while maintaining consistency with your design layout.

### Features

* Easy-to-use API with intuitive methods.
* Supports scaling width, height, radius, and font sizes.
* Offers convenient shortcuts through extension methods for numeric values.
* Defines minimum and maximum scaling factors for controlled responsiveness.

### Installation

To use this package in your Flutter project, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  responsive_view: ^1.0.0 (or any compatible version)
```

Then, run `flutter pub get` to install the package.

### Usage

1. **Wrap your MaterialApp with ResponsiveApp:**
   ```dart
   import 'package:flutter/material.dart';
   import 'package:responsive_view/responsive_view.dart';

   void main() {
     runApp(const MyApp());
   }

   class MyApp extends StatelessWidget {
     const MyApp({super.key});

     @override
     Widget build(BuildContext context) {
       return ResponsiveApp(
         designSize: Size(390, 844), // Your design screen size
         child: MaterialApp(
           home: MyHomePage(),
         ),
       );
     }
   }
   ```

2. **Use extension methods on numeric values:**
   ```dart
   class MyHomePage extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: Center(
           child: Text(
             'This text is ${16.sp} sp large.',
             style: TextStyle(fontSize: 16.sp),
           ),
         ),
       );
     }
   }
   ```

   * You can use `.w`, `.h`, `.r`, and `.sp` for width, height, radius, and font size respectively.
   * Use `.sw` and `.sh` to calculate values as multiples of screen width and height.

### Configuration

* `designSize`: The size of the device used in your design process. This serves as the baseline for scaling.
* `minMultiplier` (defaults to 0.8): The minimum scaling factor allowed for responsive values.
* `maxMultiplier` (defaults to 1.2): The maximum scaling factor allowed for responsive values.

### Contributing

We welcome contributions to this package! Please see the CONTRIBUTING.md file for details.

### License

This package is licensed under the MIT License. See the LICENSE file for details.
