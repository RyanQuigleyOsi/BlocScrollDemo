import "package:equatable/equatable.dart";
import "package:flutter/material.dart";

class HomePageOverlayState extends Equatable {
  final Widget content;
  final double width;
  final bool isVisible;

  const HomePageOverlayState({
    this.content = const SizedBox.shrink(),
    this.width = 0,
    this.isVisible = false
  });
  
  HomePageOverlayState copyWith({
    final Widget? content,
    final double? width,
    final bool? isVisible
  }) {
    return HomePageOverlayState(
      content: content ?? this.content,
      width: width ?? this.width,
      isVisible: isVisible ?? this.isVisible
    );
  }

  @override
  List<Object?> get props => [content, width, isVisible];

}