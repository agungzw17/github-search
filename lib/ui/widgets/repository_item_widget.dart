part of 'widgets.dart';

class RepositoryItemWidget extends StatelessWidget {
  RepositoryItemWidget({Key? key, this.repositoryModel}) : super(key: key);

  final RepositoryModel? repositoryModel;
  late UserModel owner;

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    DateTime createdAt = DateTime.parse(repositoryModel!.createdAt!);

    owner = UserModel.fromJson(repositoryModel!.owner!);

    return Container(
      width: widthScreen,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 25,
            child: Container(
              color: Colors.green,
              height: heightScreen * 0.13,
              child: Image.network(owner.avatarUrl!, fit: BoxFit.cover,),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              margin: EdgeInsets.only(left: widthScreen * 0.03),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: heightScreen * 0.01),
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(repositoryModel!.fullName!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText("${(createdAt.day < 10) ? "0${createdAt.day}" : createdAt.day}/${(createdAt.month < 10) ? "0${createdAt.month}" : createdAt.month}/${createdAt.year}")),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 25,
            child: Container(
              margin: EdgeInsets.only(left: widthScreen * 0.03),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText("Watchers : ${repositoryModel!.watchersCount!}", style: TextStyle(fontSize: 10),)),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText("Stars : ${repositoryModel!.stargazersCount!}", style: TextStyle(fontSize: 10))),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText("Forks : ${repositoryModel!.forksCount!}" , style: TextStyle(fontSize: 10))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
