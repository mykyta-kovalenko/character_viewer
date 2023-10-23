part of 'home_page_cubit.dart';

enum HomePageStatus {
  init,
  loading,
  success,
  error,
}

class HomePageState extends Equatable {
  final HomePageStatus status;
  final HandledError error;
  final List<Character> characters;

  const HomePageState({
    this.status = HomePageStatus.init,
    this.characters = const [],
    this.error = const HandledError.empty(),
  });

  HomePageState copyWith({
    HomePageStatus? status,
    HandledError? error,
    List<Character>? characters,
  }) {
    return HomePageState(
      status: status ?? this.status,
      error: error ?? this.error,
      characters: characters ?? this.characters,
    );
  }

  @override
  List<Object?> get props {
    return [status, error, characters];
  }
}
