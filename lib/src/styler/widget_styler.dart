part of 'styler.dart';

enum SequenceWidgets {
  padding,
  decoration,
  size,
  constraints,
  textStyle,
  opacity,
  filter,
  clipBehavior,
  alignment,
  expand,
  shrink,
}

class WidgetStyler {
  final _applySequence = <SequenceWidgets>[];

  EdgeInsets? _padding;
  BoxDecoration? _decoration;
  Size? _size;
  BoxConstraints? _constraints;
  TextStyle? _textStyle;
  double? _opacity;
  ImageFilter? _filter;
  Clip? _clipBehavior;
  Alignment? _alignment;
  int? _expand;
  int? _shrink;

  void _updatePadding({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    _applySequence.remove(SequenceWidgets.padding);
    if (_padding == null) {
      _padding = EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      );
    } else {
      _padding = _padding?.copyWith(
        top: top ?? _padding!.top,
        bottom: bottom ?? _padding!.bottom,
        left: left ?? _padding!.left,
        right: right ?? _padding!.right,
      );
    }
    _applySequence.add(SequenceWidgets.padding);
  }

  void _updateBoxDecoration({
    Color? backgroundColor,
    DecorationImage? backgroundImage,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BoxShape? shape,
  }) {
    _applySequence.remove(SequenceWidgets.decoration);
    if (_decoration == null) {
      _decoration = BoxDecoration(
        color: backgroundColor,
        image: backgroundImage,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        shape: shape ?? BoxShape.rectangle,
      );
    } else {
      _decoration = _decoration?.copyWith(
        color: backgroundColor,
        image: backgroundImage,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        shape: shape,
      );
    }
    _applySequence.add(SequenceWidgets.decoration);
  }

  void _updateSize({
    double? height,
    double? width,
  }) {
    _applySequence.remove(SequenceWidgets.size);
    if (_size == null) {
      _size = Size(width ?? 0, height ?? 0);
    } else {
      _size = Size(width ?? _size!.width, height ?? _size!.height);
    }
    _applySequence.add(SequenceWidgets.size);
  }

  void _updateConstrains({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    _applySequence.remove(SequenceWidgets.constraints);
    if (_constraints == null) {
      _constraints = BoxConstraints(
        minWidth: minWidth ?? 0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight ?? double.infinity,
      );
    } else {
      _constraints = _constraints?.copyWith(
        minWidth: minWidth ?? _constraints!.minWidth,
        maxWidth: maxWidth ?? _constraints!.maxWidth,
        minHeight: minHeight ?? _constraints!.minHeight,
        maxHeight: maxHeight ?? _constraints!.maxHeight,
      );
    }
    _applySequence.add(SequenceWidgets.constraints);
  }

  void _updateAlignment(Alignment alignment) {
    _applySequence.remove(SequenceWidgets.alignment);
    _alignment = alignment;
    _applySequence.add(SequenceWidgets.alignment);
  }

  WidgetStyler p(double? p) {
    if (p == null) return this;
    _updatePadding(top: p, bottom: p, left: p, right: p);
    return this;
  }

  WidgetStyler px(double? p) {
    if (p == null) return this;
    _updatePadding(left: p, right: p);
    return this;
  }

  WidgetStyler py(double? p) {
    if (p == null) return this;
    _updatePadding(top: p, bottom: p);
    return this;
  }

  WidgetStyler pt(double? p) {
    if (p == null) return this;
    _updatePadding(top: p);
    return this;
  }

  WidgetStyler pb(double? p) {
    if (p == null) return this;
    _updatePadding(bottom: p);
    return this;
  }

  WidgetStyler pl(double? p) {
    if (p == null) return this;
    _updatePadding(left: p);
    return this;
  }

  WidgetStyler pr(double? p) {
    if (p == null) return this;
    _updatePadding(right: p);
    return this;
  }

  WidgetStyler bgColor(Color? backgroundColor) {
    if (backgroundColor == null) return this;
    _updateBoxDecoration(backgroundColor: backgroundColor);
    return this;
  }

  WidgetStyler bgImg(DecorationImage? backgroundImage) {
    if (backgroundImage == null) return this;
    _updateBoxDecoration(backgroundImage: backgroundImage);
    return this;
  }

  WidgetStyler border(BoxBorder? border) {
    if (border == null) return this;
    _updateBoxDecoration(border: border);
    return this;
  }

  WidgetStyler radius(BorderRadiusGeometry? borderRadius) {
    if (borderRadius == null) return this;
    _updateBoxDecoration(borderRadius: borderRadius);
    return this;
  }

  WidgetStyler boxShadow(List<BoxShadow>? boxShadow) {
    if (boxShadow == null) return this;
    _updateBoxDecoration(boxShadow: boxShadow);
    return this;
  }

  WidgetStyler gradient(Gradient? gradient) {
    if (gradient == null) return this;
    _updateBoxDecoration(gradient: gradient);
    return this;
  }

  WidgetStyler shape(BoxShape? shape) {
    if (shape == null) return this;
    _updateBoxDecoration(shape: shape);
    return this;
  }

  WidgetStyler h(double? height) {
    if (height == null) return this;
    _updateSize(height: height);
    return this;
  }

  WidgetStyler w(double? width) {
    if (width == null) return this;
    _updateSize(width: width);
    return this;
  }

  WidgetStyler minW(double? minWidth) {
    if (minWidth == null) return this;
    _updateConstrains(minWidth: minWidth);
    return this;
  }

  WidgetStyler maxW(double? maxWidth) {
    if (maxWidth == null) return this;
    _updateConstrains(maxWidth: maxWidth);
    return this;
  }

  WidgetStyler minH(double? minHeight) {
    if (minHeight == null) return this;
    _updateConstrains(minHeight: minHeight);
    return this;
  }

  WidgetStyler maxH(double? maxHeight) {
    if (maxHeight == null) return this;
    _updateConstrains(maxHeight: maxHeight);
    return this;
  }

  WidgetStyler text(TextStyle? textStyle) {
    if (textStyle == null) return this;
    _applySequence.remove(SequenceWidgets.textStyle);
    _textStyle = textStyle;
    _applySequence.add(SequenceWidgets.textStyle);
    return this;
  }

  WidgetStyler opacity(double? opacity) {
    if (opacity == null) return this;
    _applySequence.remove(SequenceWidgets.opacity);
    _opacity = opacity;
    _applySequence.add(SequenceWidgets.opacity);
    return this;
  }

  WidgetStyler filter(ImageFilter? filter) {
    if (filter == null) return this;
    _applySequence.remove(SequenceWidgets.filter);
    _filter = filter;
    _applySequence.add(SequenceWidgets.filter);
    return this;
  }

  WidgetStyler clip(Clip? clipBehavior) {
    if (clipBehavior == null) return this;
    _applySequence.remove(SequenceWidgets.clipBehavior);
    _clipBehavior = clipBehavior;
    _applySequence.add(SequenceWidgets.clipBehavior);
    return this;
  }

  WidgetStyler get alignCenter {
    _updateAlignment(Alignment.center);
    return this;
  }

  WidgetStyler get alignTopLeft {
    _updateAlignment(Alignment.topLeft);
    return this;
  }

  WidgetStyler get alignTopCenter {
    _updateAlignment(Alignment.topCenter);
    return this;
  }

  WidgetStyler get alignTopRight {
    _updateAlignment(Alignment.topRight);
    return this;
  }

  WidgetStyler get alignCenterLeft {
    _updateAlignment(Alignment.centerLeft);
    return this;
  }

  WidgetStyler get alignCenterRight {
    _updateAlignment(Alignment.centerRight);
    return this;
  }

  WidgetStyler get alignBottomLeft {
    _updateAlignment(Alignment.bottomLeft);
    return this;
  }

  WidgetStyler get alignBottomCenter {
    _updateAlignment(Alignment.bottomCenter);
    return this;
  }

  WidgetStyler get alignBottomRight {
    _updateAlignment(Alignment.bottomRight);
    return this;
  }

  WidgetStyler align([Alignment? alignment]) {
    if (alignment == null) return this;
    _updateAlignment(alignment);
    return this;
  }

  WidgetStyler expand([int? flex = 1]) {
    if (flex == null) return this;
    _applySequence.remove(SequenceWidgets.expand);
    _expand = flex;
    _applySequence.add(SequenceWidgets.expand);
    return this;
  }

  WidgetStyler shrink([int? flex = 1]) {
    if (flex == null) return this;
    _applySequence.remove(SequenceWidgets.shrink);
    _shrink = flex;
    _applySequence.add(SequenceWidgets.shrink);
    return this;
  }
}
