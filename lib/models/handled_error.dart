import 'package:equatable/equatable.dart';

class HandledError extends Equatable {
  final String errorMessage;
  final bool showToast;

  const HandledError({
    required this.errorMessage,
    required this.showToast,
  });

  const HandledError.empty()
      : errorMessage = '',
        showToast = false;

  @override
  List<Object?> get props {
    return [
      errorMessage,
      showToast,
    ];
  }
}
