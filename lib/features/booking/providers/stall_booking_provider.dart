import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingState {
  final int? selectedStallId;
  final bool isHoldActive;
  final int holdTimeRemaining; // in seconds

  BookingState({
    this.selectedStallId,
    this.isHoldActive = false,
    this.holdTimeRemaining = 0,
  });

  BookingState copyWith({
    int? selectedStallId,
    bool? isHoldActive,
    int? holdTimeRemaining,
  }) {
    return BookingState(
      selectedStallId: selectedStallId ?? this.selectedStallId,
      isHoldActive: isHoldActive ?? this.isHoldActive,
      holdTimeRemaining: holdTimeRemaining ?? this.holdTimeRemaining,
    );
  }
}

class StallBookingNotifier extends StateNotifier<BookingState> {
  Timer? _holdTimer;

  StallBookingNotifier() : super(BookingState());

  void selectStall(int stallId) {
    // Logic: Request backend to hold the stall.
    // If backend returns success, we start the local timer.
    
    // Simulate Backend API Success
    state = state.copyWith(
      selectedStallId: stallId,
      isHoldActive: true,
      holdTimeRemaining: 300, // 5 minutes = 300 seconds
    );

    _startHoldTimer();
  }

  void _startHoldTimer() {
    _holdTimer?.cancel();
    _holdTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.holdTimeRemaining > 0) {
        state = state.copyWith(holdTimeRemaining: state.holdTimeRemaining - 1);
      } else {
        // Time expired! Release hold
        releaseHold();
      }
    });
  }

  void releaseHold() {
    _holdTimer?.cancel();
    // Notify backend to release stall
    state = BookingState(); // Reset state
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }
}

final stallBookingProvider = StateNotifierProvider<StallBookingNotifier, BookingState>((ref) {
  return StallBookingNotifier();
});
