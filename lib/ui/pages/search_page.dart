part of 'pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  SearchGithubItem searchGithubItem = SearchGithubItem.user;
  late SearchBloc searchBloc;
  ScrollController scrollController = ScrollController();

  bool searchIsVisible = true;
  late double heightListItem;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(onScroll);
  }

  void errorAlert(String error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "error : $error",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    });
  }

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      searchBloc.add(FetchSearch(
          query: searchController.text,
          searchGithubItem: searchGithubItem.name));
      print("maxScroll");
    }
  }

  @override
  Widget build(BuildContext context) {
    searchBloc = BlocProvider.of<SearchBloc>(context);

    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;
    heightListItem =
        (searchIsVisible == true) ? heightScreen * 0.667 : heightScreen * 0.76;

    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(children: <Widget>[
        SafeArea(
            child: Container(
          color: Colors.white,
        )),
        SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Visibility(
                visible: searchIsVisible,
                child: Container(
                  margin: EdgeInsets.only(top: heightScreen * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: widthScreen * 0.03,
                        ),
                        width: widthScreen * 0.6,
                        height: widthScreen * 0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.green)),
                        child: AutoSizeTextField(
                          controller: searchController,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                              hintText: 'Cari', border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: widthScreen * 0.12,
                        height: widthScreen * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.green)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            onTap: () {
                              if (searchController.text != '') {
                                searchBloc.add(FetchSearch(
                                    query: searchController.text,
                                    searchGithubItem: searchGithubItem.name,
                                    buttonSearch: true));
                                setState(() {});
                              }
                            },
                            splashColor: Colors.black,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: widthScreen * 0.03,
                    vertical: heightScreen * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.green,
                            value: SearchGithubItem.user,
                            groupValue: searchGithubItem,
                            onChanged: (SearchGithubItem? value) {
                              setState(() {
                                searchGithubItem = value!;
                                print(searchGithubItem.name);
                              });
                            },
                          ),
                          Text("Users")
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.green,
                            value: SearchGithubItem.issue,
                            groupValue: searchGithubItem,
                            onChanged: (SearchGithubItem? value) {
                              setState(() {
                                searchGithubItem = value!;
                                print(searchGithubItem.name);
                              });
                            },
                          ),
                          Text("Issues")
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.green,
                            value: SearchGithubItem.repository,
                            groupValue: searchGithubItem,
                            onChanged: (SearchGithubItem? value) {
                              setState(() {
                                searchGithubItem = value!;
                                print(searchGithubItem.name);
                              });
                            },
                          ),
                          Text("Repositories")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: widthScreen * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        "Lazy Loading",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: widthScreen * 0.05),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        "With Index",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollController.position.userScrollDirection ==
                        ScrollDirection.reverse) {
                      searchIsVisible = false;
                      heightListItem = heightScreen * 0.76;
                      setState(() {});
                    } else if (scrollController.position.userScrollDirection ==
                        ScrollDirection.forward) {
                      searchIsVisible = true;
                      heightListItem = heightScreen * 0.667;
                      setState(() {});
                    }
                    return false;
                  },
                  child: Container(
                      height: heightListItem,
                      width: widthScreen,
                      margin: EdgeInsets.only(
                          left: widthScreen * 0.05,
                          right: widthScreen * 0.05,
                          top: heightScreen * 0.03),
                      child: BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          if (state is SearchInitial) {
                            return Center(
                              child: const Center(
                                child: Text("Belum mencari apapun"),
                              ),
                            );
                          } else if (state is SearchLoading) {
                            return Center(
                                child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator()));
                          } else if (state is SearchError) {
                            SearchError searchError = state as SearchError;

                            // errorAlert(searchError.message!.toString());
                            return Center(
                              child: Text(searchError.message!.toString()),
                            );
                          } else {
                            SearchLoaded searchLoaded = state as SearchLoaded;

                            if (searchGithubItem.name == "user") {
                              if (searchLoaded.users!.isEmpty) {
                                return Center(
                                  child: Text("Tidak ada users"),
                                );
                              } else {
                                return ListView.builder(
                                    controller: scrollController,
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: (searchLoaded.users!.isNotEmpty)
                                        ? (searchLoaded.hasReachedMax!)
                                            ? searchLoaded.users!.length
                                            : searchLoaded.users!.length + 1
                                        : 0,
                                    itemBuilder: (context, index) => (index <
                                            searchLoaded.users!.length)
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                bottom: heightScreen * 0.01),
                                            child: UserItemWidget(
                                              userModel:
                                                  searchLoaded.users![index],
                                            ),
                                          )
                                        : (searchLoaded.users!.length < 5)
                                            ? Container()
                                            : const Center(
                                                child: SizedBox(
                                                  width: 30,
                                                  height: 30,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              ));
                              }
                            }
                            if (searchGithubItem.name == "issue") {
                              if (searchLoaded.issues!.isEmpty) {
                                return Center(
                                  child: Text("Tidak ada issue"),
                                );
                              } else {
                                return ListView.builder(
                                    controller: scrollController,
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: (searchLoaded.issues!.isNotEmpty)
                                        ? searchLoaded.issues!.length
                                        : 0,
                                    itemBuilder: (context, index) => Container(
                                          margin: EdgeInsets.only(
                                              bottom: heightScreen * 0.01),
                                          child: IssueItemWidget(
                                            issueModel:
                                                searchLoaded.issues![index],
                                          ),
                                        ));
                              }
                            }
                            if (searchGithubItem.name == "repository") {
                              if (searchLoaded.repository!.isEmpty) {
                                return Center(
                                  child: Text("Tidak ada repositories"),
                                );
                              } else {
                                return ListView.builder(
                                    controller: scrollController,
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        (searchLoaded.repository!.isNotEmpty)
                                            ? searchLoaded.repository!.length
                                            : 0,
                                    itemBuilder: (context, index) => Container(
                                          margin: EdgeInsets.only(
                                              bottom: heightScreen * 0.01),
                                          child: RepositoryItemWidget(
                                            repositoryModel:
                                                searchLoaded.repository![index],
                                          ),
                                        ));
                              }
                            } else {
                              return Container(
                                child: Text("Belum dibuat"),
                              );
                            }
                          }
                        },
                      )))
            ],
          ),
        ))
      ]),
    );
  }
}
