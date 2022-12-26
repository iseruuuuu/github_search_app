import 'package:flutter/material.dart';
import 'package:yumemi_code_check_app/api/github_api_client.dart';
import 'package:yumemi_code_check_app/model/github_response.dart';
import 'package:yumemi_code_check_app/screen/search/children/search_list_item.dart';
import 'package:yumemi_code_check_app/screen/search/children/search_text_field_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  GithubResponse? _response;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void load(String text) {
    setState(() {
      isLoading = true;
    });
    GithubApiClient().fetch(text).then((response) {
      setState(() {
        isLoading = false;
        _response = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            SearchTextFieldItem(onChanged: load),
            !isLoading
                ? SearchListItem(response: _response)
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
