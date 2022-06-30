import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:daisy_recipe/app/modules/home/controllers/home_controller.dart';
import 'package:daisy_recipe/app/modules/widgets/all_recipes_widget.dart';
import 'package:daisy_recipe/app/modules/widgets/trending_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllRecipesView extends StatefulWidget {
  const AllRecipesView({Key? key}) : super(key: key);

  @override
  State<AllRecipesView> createState() => _AllRecipesViewState();
}

class _AllRecipesViewState extends State<AllRecipesView> {

  final RefreshController _refreshController = RefreshController(initialRefresh: true);
  final homeController = Get.find<HomeController>();

  List<Recipe> allRecipes = [];

  void _onRefresh() async{
    allRecipes.clear();
    allRecipes = homeController.recipeList;
    _refreshController.resetNoData();
    await homeController.moreRandomRecipes().then((value) {
      for (var element in value) {
        allRecipes.add(element);
      }
      if(mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).onError((error, stackTrace) {
      _refreshController.refreshFailed();
    });
  }

  void _onLoading() async{
    await homeController.moreRandomRecipes().then((value) {
      if (value.isEmpty) {
        _refreshController.loadNoData();
      } else {
        for (var element in value) {
          allRecipes.add(element);
        }
        if(mounted) setState(() {});
        _refreshController.loadComplete();
      }
    }).onError((error, stackTrace) {
      _refreshController.loadFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: ()=> Get.back(),
          child: const Icon(Icons.arrow_back, color: Colors.black,),),
      ),
      body: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(),
        footer: CustomFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
          builder: (BuildContext context, LoadStatus? mode){
            Widget body ;
            if(mode == LoadStatus.idle){
              body =  const Text("pull up load");
            }
            else if(mode == LoadStatus.loading){
              body =  const CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = const Text("Load Failed! Click retry!");
            }
            else if(mode == LoadStatus.canLoading){
              body = const Text("release to load more");
            }
            else{
              body = const Text("");
            }
            return  SizedBox(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Recipes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              ),
              AppSpacer.H20,
              ...List.generate(allRecipes.length, (index) =>
                AllRecipesWidget(
                  recipe: allRecipes[index],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
