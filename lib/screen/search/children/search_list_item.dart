import 'package:flutter/material.dart';
import 'package:yumemi_code_check_app/model/github_response.dart';
import 'package:yumemi_code_check_app/screen/detail/detail_screen.dart';
import 'package:yumemi_code_check_app/screen/search/children/search_list_text_item.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({
    Key? key,
    this.response,
  }) : super(key: key);

  final GithubResponse? response;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final githubRepo = response!.items[index];
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      githubRepo.owner.avatarUrl,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                title: Text(
                  githubRepo.fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchListTextItem(
                      icon: Icons.language,
                      text: githubRepo.language.toString(),
                    ),
                    SearchListTextItem(
                      icon: Icons.star_border,
                      text: githubRepo.stargazersCount.toString(),
                    ),
                    SearchListTextItem(
                      icon: Icons.remove_red_eye,
                      text: githubRepo.watchersCount.toString(),
                    ),
                    //TODO issuesのアイコンを探す。
                    SearchListTextItem(
                      icon: Icons.circle_sharp,
                      text: githubRepo.openIssuesCount.toString(),
                    ),
                    SearchListTextItem(
                      icon: Icons.fork_left,
                      text: githubRepo.forksCount.toString(),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        githubRepo: githubRepo,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: response?.items.length ?? 0,
        ),
      ),
    );
  }
}
