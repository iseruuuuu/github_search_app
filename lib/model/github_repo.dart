import 'package:yumemi_code_check_app/model/github_repo_owner.dart';

class GithubRepo {
  final String fullName;
  final int stargazersCount;
  final String htmlUrl;
  final GithubRepoOwner owner;
  final String name;
  final String? language;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;

  GithubRepo(
    this.fullName,
    this.stargazersCount,
    this.htmlUrl,
    this.owner,
    this.name,
    this.language,
    this.watchersCount,
    this.forksCount,
    this.openIssuesCount,
  );

  GithubRepo.fromJson(Map<String, dynamic> json)
      : fullName = json['full_name'],
        stargazersCount = json['stargazers_count'],
        htmlUrl = json['html_url'],
        owner = GithubRepoOwner.fromJson(
          json['owner'],
        ),
        name = json['name'],
        language = json['language'],
        watchersCount = json['watchers_count'],
        forksCount = json['forks_count'],
        openIssuesCount = json['open_issues_count'];

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'stargazers_count': stargazersCount,
        'html_url': htmlUrl,
        'owner': owner.toJson(),
        'name': name,
        'language': language,
        'watchers_count': watchersCount,
        'forks_count': forksCount,
        'open_issues_count': openIssuesCount,
      };
}
