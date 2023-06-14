import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'widget_styler.dart';

extension ApplyStyler on Widget {
  Widget apply(void Function(WidgetStyler s) styled) {
    final styles = WidgetStyler();

    styled(styles);

    /// sequentially apply all from [WidgetStyler.applySequence] to this widget
    return styles._applySequence.fold(this, (widget, style) {
      switch (style) {
        case SequenceWidgets.padding:
          return Padding(
            padding: styles._padding!,
            child: widget,
          );
        case SequenceWidgets.decoration:
          return DecoratedBox(
            decoration: styles._decoration!,
            child: widget,
          );
        case SequenceWidgets.size:
          return SizedBox(
            width: styles._size?.width,
            height: styles._size?.height,
            child: widget,
          );
        case SequenceWidgets.constraints:
          return ConstrainedBox(
            constraints: styles._constraints!,
            child: widget,
          );
        case SequenceWidgets.textStyle:
          return DefaultTextStyle(
            style: styles._textStyle!,
            child: widget,
          );
        case SequenceWidgets.opacity:
          return Opacity(
            opacity: styles._opacity!,
            child: widget,
          );

        case SequenceWidgets.filter:
          return BackdropFilter(
            filter: styles._filter!,
            child: widget,
          );
        case SequenceWidgets.clipBehavior:
          return ClipRect(
            clipBehavior: styles._clipBehavior!,
            child: widget,
          );
        case SequenceWidgets.alignment:
          return Align(
            alignment: styles._alignment!,
            child: widget,
          );
        case SequenceWidgets.expand:
          return Expanded(
            flex: styles._expand!,
            child: widget,
          );

        case SequenceWidgets.shrink:
          return Flexible(
            flex: styles._shrink!,
            child: widget,
          );
        case SequenceWidgets.ripple:
          return InkWell(
            onTap: styles._ripple?.onTap,
            onDoubleTap: styles._ripple?.onDoubleTap,
            onLongPress: styles._ripple?.onLongPress,
            child: widget,
          );
        case SequenceWidgets.cursor:
          return MouseRegion(
            cursor: styles._cursor!,
            child: widget,
          );
        default:
          return widget;
      }
    });
  }
}
