import 'package:riverpod/riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_code_check_app/model/github_repo.dart';
import 'package:yumemi_code_check_app/model/github_response.dart';

part 'search_screen_state.freezed.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState({
    GithubResponse? githubResponse,
    @Default(false) bool isLoading,
  }) = _SearchScreenState;
}

final searchScreenStateProvider = StateProvider(
  (_) {
    return const SearchScreenState();
  },
);
