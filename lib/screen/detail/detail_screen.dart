import 'package:flutter/material.dart';
import 'package:yumemi_code_check_app/model/github_repo.dart';
import 'package:yumemi_code_check_app/screen/detail/children/detail_image_dialog.dart';
import 'package:yumemi_code_check_app/screen/detail/children/detail_text_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.githubRepo,
  }) : super(key: key);

  final GithubRepo githubRepo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(githubRepo.fullName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (_) {
                    return DetailImageDialog(
                      avatarUrl: githubRepo.owner.avatarUrl,
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  child: Image.network(
                    githubRepo.owner.avatarUrl,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
          ),
          DetailTextItem(
            title: 'Star数',
            text: githubRepo.stargazersCount.toString(),
          ),
          DetailTextItem(
            title: '開発言語',
            text: githubRepo.language.toString(),
          ),
          DetailTextItem(
            title: 'issues数',
            text: githubRepo.openIssuesCount.toString(),
          ),
          DetailTextItem(
            title: 'watcher数',
            text: githubRepo.watchersCount.toString(),
          ),
          DetailTextItem(
            title: 'リポジトリ名',
            text: githubRepo.name,
          ),
        ],
      ),
    );
  }
}
