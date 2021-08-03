library awesome_grid_view;

import 'package:flutter/material.dart';

/// Author: Amjad Jamali created on 23-June-2021
class IntrinsicGridView extends StatelessWidget {
  /// [_children] A list of widgets
  List<Widget> _children = <Widget>[];

  /// [_columnCount] will only work in vertical direction
  int _columnCount = 2;

  /// [_rowCount] will only work in horizontal direction
  int _rowCount = 2;

  /// [_direction] will handle the grid scroll direction
  ///
  /// [CustomGridView] can be scrolled in two [_direction] 1. [Axis.horizontal] 2. [Axis.vertical]
  Axis _direction = Axis.vertical;

  /// The empty space that surrounds the [CustomGridView._children].
  ///
  /// see [Decoration.padding].
  EdgeInsets _padding = EdgeInsets.zero;

  /// The empty space that surrounds the [CustomGridView].
  ///
  /// Defines the [CustomGridView]'s outer [Container.margin].
  ///
  /// The default margin is [EdgeInsets.zero]
  /// logical pixels on all sides: EdgeInsets.all(0.0)
  EdgeInsets _margin = EdgeInsets.zero;

  /// Avoid using constant [_childWidth] in vertical direction, it may cause right overflow,
  ///
  /// That's why constant [_childWidth] can only work with, it may cause right overflow,
  double _childWidth = 0.0;

  ///  It is the horizontal and vertical space between children
  EdgeInsets _childMargin = EdgeInsets.zero;

  /// background color of Grid default [backgroundColor] is [Colors.transparent].0
  Color _backgroundColor = Colors.transparent;

  /// Creates a 2D array of [children], which scrolls in horizontal [direction].
  IntrinsicGridView.horizontal({
    Key? key,
    required List<Widget> children,
    int rowCount: 2,
    double childWidth: 0.0,
    EdgeInsets margin: EdgeInsets.zero,
    EdgeInsets padding: EdgeInsets.zero,
    Color backgroundColor: Colors.transparent,
    double horizontalSpace = 0.0,
    double verticalSpace = 0.0,
  }) : super(key: key) {
    this._children = children;
    this._rowCount = rowCount;
    this._margin = margin;
    this._childMargin = EdgeInsets.symmetric(
        vertical: verticalSpace / 2, horizontal: horizontalSpace / 2);
    this._direction = Axis.horizontal;
    this._padding = padding;
    this._backgroundColor = backgroundColor;
    this._childWidth = childWidth;
  }

  /// Creates a 2D array of [children], which scrolls in vertical [direction].
  IntrinsicGridView.vertical({
    Key? key,
    required List<Widget> children,
    int columnCount: 2,
    EdgeInsets margin: EdgeInsets.zero,
    EdgeInsets padding: EdgeInsets.zero,
    double horizontalSpace = 0.0,
    double verticalSpace = 0.0,
    Color backgroundColor: Colors.transparent,
  }) : super(key: key) {
    this._children = children;
    this._columnCount = columnCount;
    this._childMargin = EdgeInsets.symmetric(
        vertical: verticalSpace / 2, horizontal: horizontalSpace / 2);
    this._margin = margin;
    this._padding = padding;
    this._backgroundColor = backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    if (_direction == Axis.horizontal) {
      return _getHorizontalGrid();
    } else {
      return _getVerticalGrid();
    }
  }

  Widget _getVerticalGrid() {
    return Container(
      margin: _margin,
      padding: _padding,
      color: _backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < _children.length;)
              IntrinsicHeight(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < _columnCount; i++, j++)
                        Expanded(
                          child: i < _children.length
                              ? Container(
                                  margin: _childMargin,
                                  child: _children.elementAt(i))
                              : Text(''),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );
  }

  Widget _getHorizontalGrid() {
    return Container(
      margin: _margin,
      padding: _padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < _children.length;)
              IntrinsicWidth(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < _rowCount; i++, j++)
                        Expanded(
                          child: Container(
                            margin: _childMargin,
                            width: _childWidth != 0 ? _childWidth : null,
                            child: i < _children.length
                                ? _children.elementAt(i)
                                : Text(''),
                          ),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );
  }
}
