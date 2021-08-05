# intrinsic_grid_view

[![pub package](https://img.shields.io/pub/v/intrinsic_grid_view.svg)](https://pub.dartlang.org/packages/intrinsic_grid_view)
[![Likes](https://badges.bar/intrinsic_grid_view/likes)](https://pub.dev/packages/intrinsic_grid_view/score)
[![popularity](https://badges.bar/intrinsic_grid_view/popularity)](https://pub.dev/packages/intrinsic_grid_view/score)
[![pub points](https://badges.bar/intrinsic_grid_view/pub%20points)](https://pub.dev/packages/intrinsic_grid_view/score)
[![Platform](https://img.shields.io/badge/platform-flutter-blue.svg)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

A Custom GridView, IntrinsicGridView provides 2D array of children with Intrinsic width and height.

Having two named Constructors

`IntrinsicGridView.vertical` scrolls in vertical direction.

`IntrinsicGridView.horizontal` scrolls in horizontal direction.


### `GridView` vs `IntrinsicGridView`
Properties                                                                        | GridView      |  IntrinsicGridView
----------------------------------------------------------------------------------|---------------|---------------------
 contents `overflow`                                                              | Yes           | No
 `children` width vary  with item width                                           | No            | Yes
 `children` height vary  with item height                                         | No            | Yes
 if any `children`'s ` height` vary,<br>the adjacent child set new `height`       | No            | Yes


## Usage

1. Add dependency.

Run this command with Flutter:

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

3. Examples:

`IntrinsicGridView.vertical` example

<img width="300px" src="https://user-images.githubusercontent.com/84534787/128336736-4869c161-9dc3-45ba-89b1-0a88494af8cf.gif?raw=true">

code
```dart
      IntrinsicGridView.vertical(
          padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
          // columnCount: 3,
          verticalSpace: 10,
          horizontalSpace: 10,
          children: [
            for (var scientist in scientists)
              _buildWidget(scientist),
          ]
      ), // IntrinsicGridView.vertical
```


`IntrinsicGridView.horizontal` example

<img width="300px" src="https://user-images.githubusercontent.com/84534787/128336722-8c9998f4-e8e2-4c6a-ad0a-e7cb7351584f.gif?raw=true">
code
```dart
      IntrinsicGridView.horizontal(
          padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
          // rowCount: 1,
          verticalSpace: 10,
          horizontalSpace: 10,
          children: [
            for (var scientist in scientists)
              _buildHorizontalWidget(scientist),
          ]
      ), // IntrinsicGridView.horizontal
```


`IntrinsicGridView.vertical` + `IntrinsicGridView.horizontal` example

<img width="300px" src="https://user-images.githubusercontent.com/84534787/128336422-6f6ee3e7-3729-4ed1-9415-f8fc03a9988f.gif?raw=true">

code
```dart
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: IntrinsicGridView.vertical(
                        padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                        columnCount: 1,
                        verticalSpace: 10,
                        horizontalSpace: 10,
                        children: [
                          for (var scientist in scientists)
                            _buildWidget(scientist),
                        ]
                    ), // IntrinsicGridView.vertical
                  ),

                  Expanded(
                    child: IntrinsicGridView.vertical(
                        padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                        // columnCount: 3,
                        verticalSpace: 10,
                        horizontalSpace: 10,
                        children: [
                          for (var scientist in scientists)
                            _buildWidget(scientist),
                        ]
                    ), // IntrinsicGridView.vertical
                  ),


                ],
              ),
            ),

            Expanded(
              child: IntrinsicGridView.horizontal(
                  padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                  // rowCount: 1,
                  verticalSpace: 10,
                  horizontalSpace: 10,
                  children: [
                    for (var scientist in scientists)
                      _buildHorizontalWidget(scientist),
                  ]
              ), // IntrinsicGridView.horizontal
            ),
          ],
        ),
```


## Contributing
Suggestions and Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## Developer Team:
[Amjad Jamali](https://github.com/amjadjamali06) & [Kamran Khan](https://github.com/kamran8545)

## License
[Apache 2.0](https://opensource.org/licenses/Apache-2.0)


