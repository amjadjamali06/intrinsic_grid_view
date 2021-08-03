library awesome_grid_view;

import 'package:flutter/material.dart';

/// Author: Amjad Jamali created on 03-Aug-2021
class IntrinsicGridView extends StatelessWidget {

  /// [_children] A list of widgets
  List<Widget> _children= <Widget>[];

  /// [_columnCount] will only work in vertical direction
  int _columnCount=2;

  /// [_rowCount] will only work in horizontal direction
  int _rowCount=2;

  /// [_direction] will handle the grid scroll direction
  ///
  /// [CustomGridView] can be scrolled in two [_direction] 1. [Axis.horizontal] 2. [Axis.vertical]
  Axis _direction=Axis.vertical;

  /// The empty space that surrounds the [CustomGridView._children].
  ///
  /// see [Decoration.padding].
  EdgeInsets _padding= EdgeInsets.zero;

  /// The empty space that surrounds the [CustomGridView].
  ///
  /// Defines the [CustomGridView]'s outer [Container.margin].
  ///
  /// The default margin is [EdgeInsets.zero]
  /// logical pixels on all sides: EdgeInsets.all(0.0)
  EdgeInsets _margin=EdgeInsets.zero;


  /// Avoid using constant [_childWidth] in vertical direction, it may cause right overflow,
  ///
  /// That's why constant [_childWidth] can only work with, it may cause right overflow,
  double _childWidth=0.0;

  ///  It is the horizontal and vertical space between children
  EdgeInsets _childMargin=EdgeInsets.zero;

  /// background color of Grid default [backgroundColor] is [Colors.transparent].0
  Color _backgroundColor=Colors.transparent;


  /// Creates a 2D array of [children], which scrolls in horizontal [direction].
  IntrinsicGridView.horizontal({
    Key? key,
    required List<Widget> children,
    int rowCount: 2,
    double childWidth:0.0,
    EdgeInsets margin: EdgeInsets.zero,
    EdgeInsets padding: EdgeInsets.zero,
    Color backgroundColor:Colors.transparent,
    double horizontalSpace=0.0,
    double verticalSpace=0.0,
  }): super(key: key){
    this._children = children;
    this._rowCount = rowCount;
    this._margin = margin;
    this._childMargin = EdgeInsets.symmetric(vertical: verticalSpace/2, horizontal: horizontalSpace/2);
    this._direction=Axis.horizontal;
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
    double horizontalSpace=0.0,
    double verticalSpace=0.0,
    Color backgroundColor:Colors.transparent,
  }): super(key: key){
    this._children = children;
    this._columnCount = columnCount;
    this._childMargin = EdgeInsets.symmetric(vertical: verticalSpace/2, horizontal: horizontalSpace/2);
    this._margin = margin;
    this._padding = padding;
    this._backgroundColor = backgroundColor;
  }


  @override
  Widget build(BuildContext context) {
    if(_direction == Axis.horizontal){
      return _getHorizontalGrid();
    }else{
       return _getVerticalGrid();
    }
  }


  Widget _getVerticalGrid(){
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
                          child: i < _children.length ?
                          Container(
                              margin: _childMargin,
                              child: _children.elementAt(i)
                          )
                              : Text(''),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );

  }


  Widget _getHorizontalGrid(){
    return Container(
      margin: _margin,
      padding: _padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < _children.length;)
              IntrinsicWidth(
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < _rowCount ; i++, j++)
                        Expanded(
                          child: Container(
                            margin: _childMargin,
                            width: _childWidth!=0?_childWidth:null,
                            child: i < _children.length?_children.elementAt(i):Text(''),
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












/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
/*||||||||||||||||||||||||||||||||||||||||||||||||||||||| AwesomeGridView |||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

/// Author: Amjad Jamali created on 23-June-2021
class AwesomeGridView extends StatelessWidget {

  /// [children] A list of widgets
  final List<Widget> children;
  /// [columnCount] will only work in vertical direction
  final int columnCount;
  /// [rowCount] will only work in horizontal direction
  final int rowCount;
  /// [direction] will handle the grid scroll direction
  ///
  /// [CustomGridView] can be scrolled in two [direction] 1. [Axis.horizontal] 2. [Axis.vertical]
  final Axis direction;
  /// The empty space that surrounds the [CustomGridView.children].
  ///
  /// see [Decoration.padding].
  final EdgeInsets padding;
  /// The empty space that surrounds the [CustomGridView].
  ///
  /// Defines the [CustomGridView]'s outer [Container.margin].
  ///
  /// The default margin is [EdgeInsets.zero]
  /// logical pixels on all sides: EdgeInsets.all(0.0)
  final EdgeInsets margin;
  /// Vertical space between [children]
  final double verticalSpace;
  /// Horizontal space between [children]
  final double horizontalSpace;
  /// when [stretchWithSides] is 'true', the width of [children] will stretch to the parent sides in vertical [direction],
  /// And height of [children] will stretch to the parent sides in horizontal [direction],
  final bool stretchWithSides;

  final Alignment alignment;

  /// Avoid using constant [childWidth] in vertical direction, it may cause right overflow,
  ///
  /// That's why constant [childWidth] can only work with, it may cause right overflow,
  final double childWidth;
  /// Avoid using constant [childHeight] in horizontal direction, it may cause bottom overflow
  final double childHeight;


  /*  Other variable for design purpose  */
  final Color backgroundColor;

  final Color childBackgroundColor;

  final Color childBorderColor;

  Color childShadowColor;

  final bool enableChildShadow;

  final double childShadowRadius;

  final BorderRadius childBorderRadius;

  final BorderRadius childRadius;

  final EdgeInsets borderWidth;


  /// Creates a 2D array of [children], which scrolls in two [direction]s.
  ///
  /// 1. Horizontally, when [direction] is set to [Axis.horizontal]
  ///
  /// 2. Vertically, when [direction] is set to [Axis.vertical]
  ///
  ///Default behavior is always vertical
  ///
  ///
  ///
  AwesomeGridView({
    this.children: const [],
    this.columnCount: 2,
    this.rowCount: 2,
    this.childShadowColor:Colors.transparent,
    this.childShadowRadius:6.0,
    this.enableChildShadow:false,
    this.alignment:Alignment.topLeft,
    this.backgroundColor:Colors.transparent,
    this.childBackgroundColor:Colors.transparent,
    this.childBorderColor:Colors.transparent,
    this.childWidth: 0.0,
    this.childRadius:BorderRadius.zero,
    this.borderWidth:EdgeInsets.zero,
    this.childBorderRadius:BorderRadius.zero,
    this.childHeight: 0.0,
    this.direction:Axis.vertical,
    this.padding: EdgeInsets.zero,
    this.margin: EdgeInsets.zero,
    this.verticalSpace: 0.0,
    this.horizontalSpace: 0.0,
    this.stretchWithSides:false,
  });/* {
    horizontalSpace = horizontalSpace / 2;
    if(columnCount==1)horizontalSpace=0;
  }*/

  @override
  Widget build(BuildContext context) {

    if(!enableChildShadow || childShadowRadius==0){
      childShadowColor = Colors.transparent;
    }



    if(direction == Axis.horizontal){
      if(rowCount == 0)
        return _getVerticalWrap();
      else if(/*childHeight==0 &&*/ childWidth>0)
        return _getHorizontalGridWithConstantWidth();
      // else if(childHeight>0 && childWidth==0)
      //   return _getHorizontalGridWithConstantHeight();
      // else if(childHeight>0 && childWidth>0)
      //   return _getHorizontalGridWithConstantWidthAndHeight();
      return _getHorizontalGrid();
    }else{
      if(columnCount == 0)
        return _getVerticalWrap();
      // if(childHeight==0 && childWidth>0)
      //   return _getVerticalGridWithConstantWidth();
      else if(childHeight>0 /*&& childWidth==0*/)
        return _getVerticalGridWithConstantHeight();
      // else if(childHeight>0 && childWidth>0)
      //   return _getVerticalGridWithConstantWidthAndHeight();
      return _getVerticalGrid();
    }


  }












////////////////////// Done ////////////////////

  //=================== Verticals =========================//
  Widget _getVerticalGrid(){

    double verticalSpaceOut = (verticalSpace/3)*2;
    double verticalSpaceIn = verticalSpace/3;

    RoundedRectangleBorder shape = RoundedRectangleBorder(
        borderRadius: childBorderRadius
    );
    BoxDecoration decoration = BoxDecoration(
      color: childBackgroundColor,
      borderRadius: childRadius,
    );

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < children.length;)
              IntrinsicHeight(
                child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < columnCount && (!stretchWithSides || i < children.length); i++, j++)
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.only(
                              top: i < columnCount ? 0 : horizontalSpace,
                              left: j == 0 ? 0 : ((j == columnCount - 1) ? verticalSpaceOut:verticalSpaceIn),
                              right: j == columnCount - 1 ? 0: (j==0?verticalSpaceOut : verticalSpaceIn),
                            ),
                            shape: shape,
                            shadowColor: childShadowColor,
                            elevation: childShadowRadius,
                            color: childBorderColor,
                            child: Container(
                              margin: borderWidth,
                              decoration: decoration,// color: childBackgroundColor,
                              // margin: EdgeInsets.only(
                              //   top: i < columnCount ? 0 : horizontalSpace,
                              //   left: j == 0 ? 0 : ((j == columnCount - 1) ? verticalSpaceOut:verticalSpaceIn),
                              //   right: j == columnCount - 1 ? 0: (j==0?verticalSpaceOut : verticalSpaceIn),
                              // ),
                              child: i < children.length?children.elementAt(i):Text(''),
                            ),
                          ),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );

  }

  Widget _getVerticalGridOK(){

    double verticalSpaceOut = (verticalSpace/3)*2;
    double verticalSpaceIn = verticalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < children.length;)
              IntrinsicHeight(
                child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < columnCount && (!stretchWithSides || i < children.length); i++, j++)
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: i < columnCount ? 0 : horizontalSpace,
                              left: j == 0 ? 0 : ((j == columnCount - 1) ? verticalSpaceOut:verticalSpaceIn),
                              right: j == columnCount - 1 ? 0: (j==0?verticalSpaceOut : verticalSpaceIn),
                            ),
                            child: i < children.length?children.elementAt(i):Text(''),
                          ),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );

  }

  Widget _getVerticalGridWithConstantWidth(){

    double verticalSpaceOut = (verticalSpace/3)*2;
    double verticalSpaceIn = verticalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < children.length;)
              IntrinsicHeight(
                child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < columnCount ; i++, j++)
                        Container(
                          width: childWidth,
                          margin: EdgeInsets.only(
                            top: i < columnCount ? 0 : horizontalSpace,
                            left: j == 0 ? 0 : ((j == columnCount - 1) ? verticalSpaceOut:verticalSpaceIn),
                            right: j == columnCount - 1 ? 0: (j==0?verticalSpaceOut : verticalSpaceIn),
                          ),
                          child: InkWell(enableFeedback: true,onTap: (){}, onHover: (b){}, child: i < children.length?children.elementAt(i):Text('')),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );

  }

  Widget _getVerticalGridWithConstantHeight(){

    double verticalSpaceOut = (verticalSpace/3)*2;
    double verticalSpaceIn = verticalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < children.length;)
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int j = 0; j < columnCount && (!stretchWithSides || i < children.length); i++, j++)
                      Expanded(
                        child: Container(
                          height: childHeight,
                          margin: EdgeInsets.only(
                            top: i < columnCount ? 0 : horizontalSpace,
                            left: j == 0 ? 0 : ((j == columnCount - 1) ? verticalSpaceOut:verticalSpaceIn),
                            right: j == columnCount - 1 ? 0: (j==0?verticalSpaceOut : verticalSpaceIn),
                          ),
                          child: i < children.length?children.elementAt(i):Text(''),
                        ),
                      ),
                  ])
          ],
        ),
      ),
    );

  }

  Widget _getVerticalGridWithConstantWidthAndHeight(){

    double verticalSpaceOut = (verticalSpace/3)*2;
    double verticalSpaceIn = verticalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < children.length;)
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int j = 0; j < columnCount; i++, j++)
                      Container(
                        width: childWidth,
                        height: childHeight,
                        margin: EdgeInsets.only(
                          top: i < columnCount ? 0 : horizontalSpace,
                          left: j == 0 ? 0 : ((j == columnCount - 1) ? verticalSpaceOut:verticalSpaceIn),
                          right: j == columnCount - 1 ? 0: (j==0?verticalSpaceOut : verticalSpaceIn),
                        ),
                        child: i < children.length?children.elementAt(i):Text(''),
                      ),
                  ])
          ],
        ),
      ),
    );

  }

  //=================== Verticals =========================//
  Widget _getHorizontalGridWithConstantWidthAndHeight(){

    double horizontalSpaceOut = (horizontalSpace/3)*2;
    double horizontalSpaceIn = horizontalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < children.length;)
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int j = 0; j < rowCount; i++, j++)
                      Container(
                        width: childWidth,
                        height: childHeight,
                        margin: EdgeInsets.only(
                          left: i < rowCount ? 0 : verticalSpace,
                          top: j == 0 ? 0 : ((j == rowCount - 1) ? horizontalSpaceOut:horizontalSpaceIn),
                          bottom: j == rowCount - 1 ? 0: (j==0?horizontalSpaceOut : horizontalSpaceIn),
                        ),
                        child: i < children.length?children.elementAt(i):Text(''),
                      ),
                  ])
          ],
        ),
      ),
    );

  }

  Widget _getHorizontalGridWithConstantHeight(){

    double horizontalSpaceOut = (horizontalSpace/3)*2;
    double horizontalSpaceIn = horizontalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < children.length;)
              IntrinsicWidth(
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < rowCount; i++, j++)
                        Container(
                          height: childHeight,
                          margin: EdgeInsets.only(
                            left: i < rowCount ? 0 : verticalSpace,
                            top: j == 0 ? 0 : ((j == rowCount - 1) ? horizontalSpaceOut:horizontalSpaceIn),
                            bottom: j == rowCount - 1 ? 0: (j==0?horizontalSpaceOut : horizontalSpaceIn),
                          ),
                          child: i < children.length?children.elementAt(i):Text(''),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );

  }

  Widget _getHorizontalGridWithConstantWidth(){

    double horizontalSpaceOut = (horizontalSpace/3)*2;
    double horizontalSpaceIn = horizontalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < children.length;)
              IntrinsicWidth(
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < rowCount && (!stretchWithSides || i < children.length); i++, j++)
                        Expanded(
                          child: Container(
                            width: childWidth,
                            margin: EdgeInsets.only(
                              left: i < rowCount ? 0 : verticalSpace,
                              top: j == 0 ? 0 : ((j == rowCount - 1) ? horizontalSpaceOut:horizontalSpaceIn),
                              bottom: j == rowCount - 1 ? 0: (j==0?horizontalSpaceOut : horizontalSpaceIn),
                            ),
                            child: i < children.length?children.elementAt(i):Text(''),
                          ),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );

  }

  Widget _getHorizontalGrid(){

    double horizontalSpaceOut = (horizontalSpace/3)*2;
    double horizontalSpaceIn = horizontalSpace/3;

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < children.length;)
              IntrinsicWidth(
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < rowCount && (!stretchWithSides || i < children.length); i++, j++)
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: i < rowCount ? 0 : verticalSpace,
                              top: j == 0 ? 0 : ((j == rowCount - 1) ? horizontalSpaceOut:horizontalSpaceIn),
                              bottom: j == rowCount - 1 ? 0: (j==0?horizontalSpaceOut : horizontalSpaceIn),
                            ),
                            child: i < children.length?children.elementAt(i):Text(''),
                          ),
                        ),
                    ]),
              )
          ],
        ),
      ),
    );

  }



  Widget _getVerticalWrap() {
    return Container(
        alignment: alignment,
        margin: margin,
        padding: padding,
        child: SingleChildScrollView(
          child: Wrap(
              direction: direction,
              children: [
                for (int i = 0; i < children.length;)
                  children.elementAt(i),
              ]),
        )
    );
  }

}
