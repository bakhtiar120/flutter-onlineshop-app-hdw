import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/core/assets/assets.gen.dart';
import 'package:flutter_onlineshop_app/core/components/search_input.dart';
import 'package:flutter_onlineshop_app/core/components/spaces.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/alexandre_christie/alexandre_christie_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/casio/casio_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/lanccelot/lanccelot_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/banner_slider.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/organism/menu_categories.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/organism/product_list.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/title_content.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
 final List<String> banners1 = [
    Assets.images.banner1.path,
    Assets.images.banner1.path,
  ];
  final List<String> banners2 = [
    Assets.images.banner2.path,
    Assets.images.banner2.path,
    Assets.images.banner2.path,
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    context.read<AllProductBloc>().add(const AllProductEvent.getAllProducts());
    context.read<CasioBloc>().add(const CasioEvent.getAllCasios());
    context.read<AlexandreChristieBloc>().add(const AlexandreChristieEvent.getAllAlexandreChristies());
    context.read<LanccelotBloc>().add(const LanccelotEvent.getAllLanccelots());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HDW Store'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.notification.svg(height: 24.0),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(
                RouteConstants.cart,
                pathParameters: PathParameters().toMap(),
              );
            },
            icon: Assets.icons.cart.svg(height: 24.0),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchInput(
            controller: searchController,
            onTap: () {
              context.pushReplacementNamed(
                RouteConstants.root,
                pathParameters: PathParameters(
                  rootTab: RootTab.explore,
                ).toMap(),
              );
            },
          ),
          const SpaceHeight(16.0),
          BannerSlider(items: banners1),
          const SpaceHeight(12.0),
          TitleContent(
            title: 'Categories',
            onSeeAllTap: () {},
          ),
          const SpaceHeight(12.0),
          const MenuCategories(),
          const SpaceHeight(50.0),
          BlocBuilder<AllProductBloc, AllProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                      title: 'Featured Product',
                      onSeeAllTap: () {},
                      items: products.length > 2
                          ? products.sublist(0, 2)
                          : products);
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          const SpaceHeight(50.0),
          BannerSlider(items: banners2),
          const SpaceHeight(28.0),
          BlocBuilder<CasioBloc, CasioState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                      title: 'Gshock',
                      onSeeAllTap: () {},
                      items: products.length > 2
                          ? products.sublist(0, 2)
                          : products);
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          const SpaceHeight(50.0),
           BlocBuilder<AlexandreChristieBloc, AlexandreChristieState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                      title: 'Alexandre Christie',
                      onSeeAllTap: () {},
                      items: products.length > 2
                          ? products.sublist(0, 2)
                          : products);
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          const SpaceHeight(50.0),
           BlocBuilder<LanccelotBloc, LanccelotState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                      title: 'Lanccelot',
                      onSeeAllTap: () {},
                      items: products.length > 2
                          ? products.sublist(0, 2)
                          : products);
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          const SpaceHeight(50.0),
          // ProductList(
          //   title: 'Special Offers',
          //   onSeeAllTap: () {},
          //   items: specialOffers,
          // ),
        ],
      ),
    );
  }
}
