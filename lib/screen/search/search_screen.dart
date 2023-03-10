import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_code_check_app/notifier/search_screen_notifier.dart';
import 'package:yumemi_code_check_app/screen/search/children/search_list_item.dart';
import 'package:yumemi_code_check_app/screen/search/children/search_text_field_item.dart';
import 'package:yumemi_code_check_app/state/search_screen_state.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readState = ref.watch(searchScreenStateProvider);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: SearchTextFieldItem(
                onChanged: ref.read(searchScreenNotifierProvider).load,
              ),
            ),
            !readState.isLoading
                ? SearchListItem(response: readState.githubResponse)
                : SizedBox(
                    width: deviceSize.width,
                    //TODO あとでこのサイズを調整する
                    height: deviceSize.height - 175,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
          ],
        ),
      ),
    );
  }
}
