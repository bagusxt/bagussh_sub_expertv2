import 'package:equatable/equatable.dart';

import 'package:sub_bagussh/data/models/tvclil/tvclil_model.dart';

class 
  TvclilResponse 

extends 
  Equatable 

{

final 
  List
    <TvclilModel> 
       tvList;

  TvclilResponse
    ({required 
      this.tvList});

  factory 
    TvclilResponse
      .fromJson
        (Map
          <String,
            dynamic> 
              json) =>


  TvclilResponse(
    tvList: 
      List
        <TvclilModel>
          .from
            ((json
              ["results"] 
                as List)
                   .map((x) => 
                   

  TvclilModel
    .fromJson(x))
       .where
        ((element) 
          => element
            .posterPath 
                != null)),
  );


  Map
    <String, 
      dynamic> 
        toJson() =>

  {
    
    "results": 
      List
        <dynamic>
          .from
            (tvList.map((x)
             => x.toJson())),
  };

  @override

    List
      <Object>
        get props => 
         [tvList];
         
}