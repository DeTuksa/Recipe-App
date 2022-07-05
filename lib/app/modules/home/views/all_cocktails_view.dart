import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/cocktail_model.dart';
import 'package:daisy_recipe/app/modules/home/controllers/home_controller.dart';
import 'package:daisy_recipe/app/modules/widgets/all_cocktails_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllCocktailsView extends StatefulWidget {
  const AllCocktailsView({Key? key}) : super(key: key);

  @override
  State<AllCocktailsView> createState() => _AllCocktailsViewState();
}

class _AllCocktailsViewState extends State<AllCocktailsView> {

  final RefreshController _refreshController = RefreshController(initialRefresh: true);
  final homeController = Get.find<HomeController>();

  List<Drink> allCocktails = [];

  void _onRefresh() async{
    allCocktails.clear();
    allCocktails = homeController.cocktailList;
    _refreshController.resetNoData();
    await homeController.getMoreCocktails().then((value) {
      for (var element in value) {
        allCocktails.add(element);
      }
      if(mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).onError((error, stackTrace) {
      _refreshController.refreshFailed();
    });
  }

  void _onLoading() async{
    await homeController.getMoreCocktails().then((value) {
      if (value.isEmpty) {
        _refreshController.loadNoData();
      } else {
        for (var element in value) {
          allCocktails.add(element);
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
                child: Text('Cocktails', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              ),
              AppSpacer.H20,
              ...List.generate(allCocktails.length, (index) =>
                  AllCocktailsTile(
                    cocktail: allCocktails[index],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
