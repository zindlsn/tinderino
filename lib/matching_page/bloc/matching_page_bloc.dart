import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'matching_page_events.dart';
part 'matching_page_state.dart';

class MatchingPageBloc extends Bloc<MatchingPageEvent, MatchingPageState> {
  MatchingPageBloc()
      : super(const MatchingPageState(
          status: MatchingPageStatus.initial,
        )) {}
}
