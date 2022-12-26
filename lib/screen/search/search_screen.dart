import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_code_check_app/api/github_api_client.dart';
import 'package:yumemi_code_check_app/model/github_response.dart';
import 'package:yumemi_code_check_app/notifier/search/search_screen_notifier.dart';
import 'package:yumemi_code_check_app/screen/search/children/search_list_item.dart';
import 'package:yumemi_code_check_app/screen/search/children/search_text_field_item.dart';
import 'package:yumemi_code_check_app/state/search/search_screen_state.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readState = ref.watch(searchScreenStateProvider);
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            SearchTextFieldItem(
              onChanged: ref.read(searchScreenNotifierProvider).load,
            ),
            !readState.isLoading
                ? SearchListItem(response: readState.githubResponse)
                : const Center(child: CircularProgressIndicator()),

            //   //TODO 初期と、検索してもヒットしない場合
            //   // _response!.items.isNotEmpty
            //   ((_response) != null || _response!.items.isNotEmpty)
            //       ? const SearchListItem()
            //       : Container(color: Colors.red),
          ],
        ),
      ),
    );
  }
}
