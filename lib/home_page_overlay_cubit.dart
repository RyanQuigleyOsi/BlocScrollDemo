
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'home_page_overlay_state.dart';

class HomePageOverlayCubit extends Cubit<HomePageOverlayState> {
  HomePageOverlayCubit() : super(const HomePageOverlayState());

  Future<void> newOverlay({required final Widget content, final double width = 500 }) async {
    emit(state.copyWith(content: content, width: width, isVisible: true));
  }

  Widget get content => state.content;
  double get width => state.width;
  bool get isVisible => state.isVisible;

  
}