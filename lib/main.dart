import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sub_bagussh/common/constants.dart';
import 'package:sub_bagussh/common/utils.dart';
import 'package:sub_bagussh/presentation/pages/about_page.dart';
import 'package:sub_bagussh/presentation/pages/tvclil_splash.dart';
import 'package:sub_bagussh/presentation/pages/home_tvclil_page.dart';
import 'package:sub_bagussh/presentation/pages/movie_detail_page.dart';
import 'package:sub_bagussh/presentation/pages/home_movie_page.dart';
import 'package:sub_bagussh/presentation/pages/popular_movies_page.dart';
import 'package:sub_bagussh/presentation/pages/popular_tvclil_page.dart';
import 'package:sub_bagussh/presentation/pages/search_page.dart';
import 'package:sub_bagussh/presentation/pages/search_page_tvclil.dart';
import 'package:sub_bagussh/presentation/pages/top_rated_movies_page.dart';
import 'package:sub_bagussh/presentation/pages/top_rated_tvclil_page.dart';
import 'package:sub_bagussh/presentation/pages/tvclil_detail_page.dart';
import 'package:sub_bagussh/presentation/pages/watchlist_movies_page.dart';
import 'package:sub_bagussh/presentation/pages/watchlist_tvclil_page.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/watchlist/tv_watchlist_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_watchlist/movie_watchlist_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:sub_bagussh/common/ssl_pinning.dart';
import 'package:sub_bagussh/injection.dart' as di;

void main() 

async {
  
WidgetsFlutterBinding.ensureInitialized();

await
   Firebase.initializeApp();

await 
  SSLPinning.init();

di.init();
  runApp(MyApp());

}

class 
MyApp 

extends 
StatelessWidget {

  @override

  Widget 
  build
  
(BuildContext context) {
 return 

MultiProvider(
providers: [
        
//movi
BlocProvider( create: (_) => di.locator<MovieDetailBloc>(
),),


BlocProvider(create: (_) => di.locator<MoviePopularBloc>(
),),
       

BlocProvider(create: (_) => di.locator<MovieRecommendationBloc>(
), ),


BlocProvider(create: (_) => di.locator<MovieSearchBloc>(
), ),

BlocProvider(create: (_) => di.locator<MovieTopRatedBloc>(
),),


BlocProvider(create: (_) => di.locator<MovieNowPlayingBloc>(
),),


BlocProvider(create: (_) => di.locator<MovieWatchlistBloc>(
),),


//Tv
BlocProvider( create: (_) => di.locator<TvDetailBloc>(
),),


BlocProvider(create: (_) => di.locator<TvRecommendationBloc>(
),),


BlocProvider(create: (_) => di.locator<TvSearchBloc>(
),),


BlocProvider(create: (_) => di.locator<TvPopularBloc>(
),),


BlocProvider(create: (_) => di.locator<TvTopRatedBloc>(
),),


BlocProvider(create: (_) => di.locator<TvOnAirBloc>(
),),


BlocProvider(create: (_) => di.locator<TvWatchlistBloc>(
),),],


child: MaterialApp(title: 'Flutter Demo',
theme: ThemeData.dark().copyWith(

colorScheme: 
  kColorScheme,

primaryColor: 
  kRichBlack,

scaffoldBackgroundColor: 
 kRichBlack,

textTheme: 
  kTextTheme,
),

home:
SplashScreen(),

navigatorObservers: [routeObserver],onGenerateRoute: (RouteSettings settings) { switch (settings.name)
{

   case '/home': return MaterialPageRoute(builder: 
   (_) => HomeMoviePage());


   case PopularMoviesPage.ROUTE_NAME:
   return CupertinoPageRoute(builder:


   (_) => PopularMoviesPage());
   case TopRatedMoviesPage.ROUTE_NAME:


   return CupertinoPageRoute(builder: 
   (_) => TopRatedMoviesPage());


   case MovieDetailPage.ROUTE_NAME:final id = settings.arguments as int;
   return MaterialPageRoute(builder: (_) => MovieDetailPage(id: id), settings: settings, );


   case '/tv':return MaterialPageRoute(builder:
   (_) => HomeTvclilPage());


   case PopularTvclilPage.ROUTE_NAME: 
   return CupertinoPageRoute(builder: 


   (_) => PopularTvclilPage());
   case TopRatedTvclilPage.ROUTE_NAME:


   return CupertinoPageRoute(builder:
   (_) => TopRatedTvclilPage());


   case TvclilDetailPage.ROUTE_NAME:
   final id = settings.arguments as int;


   return MaterialPageRoute(builder: (_) => TvclilDetailPage(id: id), settings: settings, );


  case SearchPage.ROUTE_NAME: return CupertinoPageRoute
  (builder: (_) => SearchPage());


  case SearchTvclilPage.ROUTE_NAME:
  return CupertinoPageRoute
  

  (builder: (_) => SearchTvclilPage());
  case WatchlistMoviesPage.ROUTE_NAME:


  return MaterialPageRoute(builder: 
  (_) => WatchlistMoviesPage());


  case WatchlistTvclilPage.ROUTE_NAME:
  return MaterialPageRoute(builder:


  (_) => WatchlistTvclilPage());
  case AboutPage.ROUTE_NAME:

  
  return MaterialPageRoute(builder: (_) => AboutPage());
  default: return MaterialPageRoute(builder: (_) { return Scaffold
  (
    
  body: Center(child: Text('Page not found :('),),
                );
              }
           );
          }
        },
      ),
    );
  }
}