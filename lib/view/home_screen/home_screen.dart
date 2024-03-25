import 'package:api_newspaper_task/controller/home_screen_controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initstate() {
    super.initState();
  }

  fetchData() async {
    await Provider.of<HomeScreenController>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = Provider.of<HomeScreenController>(context);
    return Scaffold(
      body: homeScreenState.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: homeScreenState.dataList?.length,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Text(homeScreenState.dataList?[index].url ?? "empty"),
                  )),
    );
  }
}
