# intrinsic_grid_view

[![pub package](https://img.shields.io/pub/v/intrinsic_grid_view.svg)](https://pub.dartlang.org/packages/intrinsic_grid_view)
[![Platform](https://img.shields.io/badge/platform-flutter-blue.svg)](https://flutter.dev)
[![Likes](https://badges.bar/intrinsic_grid_view/likes)](https://pub.dev/packages/intrinsic_grid_view/score)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

A Custom GridView provides 2D array of children Intrinsic with and height.

Having two named Constructors

`IntrinsicGridView.vertical` scrolls in vertical direction.

`IntrinsicGridView.horizontal` scrolls in horizontal direction.

## Demo Screenshots
IntrinsicGridView.vertical     | IntrinsicGridView.horizontal  | vertical + horizontal
:-----------------------------:|:-----------------------------:|:-----------------------:
<img width="280px" src="screenshots/vertical_demo.gif?raw=true">|<img width="280px" src="screenshots/horizontal_demo.gif?raw=true">|<img width="280px" src="screenshots/mix_demo.gif?raw=true">


### `GridView` vs `IntrinsicGridView`
Properties                                                                        | GridView      |  IntrinsicGridView
:--------------------------------------------------------------------------------:|:-------------:|:--------------------:
 contents `overflow`                                                              | Yes           | No
 `children` width vary  with item width                                           | No            | Yes
 `children` height vary  with item height                                         | No            | Yes
 if any `children`'s ` height` vary,<br>the adjacent child set new `height`       | No            | Yes


## Usage

1. Add dependency.

Run this command:

With Flutter:

```dart
$ flutter pub add intrinsic_grid_view
```

or add following package in your `pubspec.yaml` file inside the `dependencies:` section.
```dart
dependencies:
  intrinsic_grid_view: ^0.0.1
```
2. Importing the library:

```dart
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
```

3. In vertical direction:

```dart
      IntrinsicGridView.vertical(
          columnCount: 4,
          margin: EdgeInsets.symmetric(horizontal: 20),
          verticalSpace: 0,
          horizontalSpace: 0,

          children: [
              for (var scientist in scientists)
                  _buildWidget(scientist),
          ],
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
          ],
      ), // IntrinsicGridView.horizontal
```


## Developer Team:
[Amjad Jamali](https://github.com/amjadjamali06) & [Kamran Khan](https://github.com/kamran8545)

## License
[Apache 2.0](https://opensource.org/licenses/Apache-2.0)


