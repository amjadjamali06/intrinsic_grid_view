# awesom_grid_view

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A Custom GridView
This GridView provides 2D array of children Intrinsic with and height.
Having two named Constructors
`IntrinsicGridView.vertical` scroll direction of children is vertical.
`IntrinsicGridView.horizontal` scroll direction of children is vertical.


## Usage

1. Add dependency.

Run this command:

With Flutter:

```dart
$ flutter pub add awesom_grid_view
```

or add following package in your `pubspec.yaml` file inside the `dependencies:` section.
```dart
dependencies:
  awesom_grid_view: ^0.0.1
```
2. Importing the library:

```dart
import 'package:awesom_grid_view/intrinsic_grid_view.dart';
```

3. In vertical direction:

```dart
      IntrinsicGridView.vertical(
           columnCount: 4,
           margin: EdgeInsets.symmetric(horizontal: 20),
           verticalSpace: 0,
           horizontalSpace: 0,

           children: [
             for (var w in widgetList)
               _buildWidget(v),
           ]
      ), // IntrinsicGridView.vertical
```


4. In horizontal direction:

```dart
      IntrinsicGridView.horizontal(
           rowCount: 4,
           margin: EdgeInsets.symmetric(horizontal: 20),
           verticalSpace: 0,
           horizontalSpace: 0,

           children: [
             for (var w in widgetList)
               _buildWidget(v),
           ]
      ), // IntrinsicGridView.horizontal
```


## Developer Team:
Amjad Jamali & his team member (Kamran Khan)

## License
[MIT](https://choosealicense.com/licenses/mit/)


