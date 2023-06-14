import 'dart:ui';

import 'package:flutter/widgets.dart';

extension SetProperties on Widget {
  Widget set({
    EdgeInsets? padding,
    Color? backgroundColor,
    DecorationImage? backgroundImage,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BoxShape? shape,
    double? height,
    double? width,
    TextStyle? textStyle,
    Alignment? alignment,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
    double? opacity,
    ImageFilter? filter,
  }) {
    assert(
      height == null || (minHeight == null && maxHeight == null),
      'Cannot provide both a height and a min or max height.\n',
    );

    assert(
      width == null || (minWidth == null && maxWidth == null),
      'Cannot provide both a width and a min or max width.\n',
    );

    Widget child = this;

    if (padding != null) {
      child = Padding(padding: padding, child: child);
    }

    if (backgroundColor != null ||
        backgroundImage != null ||
        border != null ||
        borderRadius != null ||
        boxShadow != null ||
        gradient != null ||
        shape != null) {
      child = DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            image: backgroundImage,
            border: border,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            gradient: gradient,
            shape: shape ?? BoxShape.rectangle,
          ),
          child: child);
    }

    if (height != null || width != null) {
      child = SizedBox(
        height: height,
        width: width,
        child: child,
      );
    }

    if (minWidth != null ||
        maxWidth != null ||
        minHeight != null ||
        maxHeight != null) {
      child = ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minWidth ?? 0.0,
          maxWidth: maxWidth ?? double.infinity,
          minHeight: minHeight ?? 0.0,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: child,
      );
    }

    if (opacity != null) {
      child = Opacity(opacity: opacity, child: child);
    }

    if (filter != null) {
      child = BackdropFilter(filter: filter, child: child);
    }

    if (textStyle != null) {
      child = DefaultTextStyle(style: textStyle, child: child);
    }

    if (alignment != null) {
      child = Align(alignment: alignment, child: child);
    }

    return child;
  }
}

extension Expand on Widget {
  Widget expand({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );
}

extension Shrink on Widget {
  Widget shrink({int flex = 1}) => Flexible(
        flex: flex,
        child: this,
      );
}
