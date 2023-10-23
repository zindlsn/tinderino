part of 'matching_page_bloc.dart';

enum MatchingPageStatus { initial, loading, success, failure }

class MatchingPageState extends Equatable {
  const MatchingPageState({
    required this.status,
    this.error,
  });

  final MatchingPageStatus status;
  final String? error;

  @override
  List<Object?> get props => [status, error];

  MatchingPageState copyWith({
    MatchingPageStatus? status,
    String? error,
  }) {
    return MatchingPageState(
      status: status ?? this.status,
      error: error,
    );
  }
}