import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_code_check_app/api/github_api_client.dart';
import 'package:yumemi_code_check_app/state/search_screen_state.dart';

class SearchScreenNotifier extends StateNotifier<SearchScreenState> {
  SearchScreenNotifier({required this.ref}) : super(const SearchScreenState());

  final Ref ref;
  bool isLoading = false;

  void load(String text) {
    isLoading = true;
    ref.read(searchScreenStateProvider.notifier).update((_) {
      return const SearchScreenState(
        isLoading: true,
      );
    });
    GithubApiClient().fetch(text).then((response) {
      isLoading = false;
      ref.read(searchScreenStateProvider.notifier).update((_) {
        return SearchScreenState(
          githubResponse: response,
          isLoading: false,
        );
      });
    });
  }
}

final searchScreenNotifierProvider = Provider(
  (ref) {
    return SearchScreenNotifier(ref: ref);
  },
);
