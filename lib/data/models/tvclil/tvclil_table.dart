import 'package:equatable/equatable.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

class TvclilTable extends Equatable 
{
  final int 
  id;

  final String?
  name;

  final String? 
  posterPath;

  final String? 
  overview;

  TvclilTable(
  {
    required this.id,
    required this.name,

    required this.posterPath,
    required this.overview,
  }
  );

  factory TvclilTable.fromEntity
  (TvclilDetail tv) 
  => TvclilTable
  (
    id: tv.id,
    name: tv.name,

    posterPath: tv.posterPath,
    overview: tv.overview,
  );

  factory TvclilTable.fromMap(Map<String, dynamic> map)
  => TvclilTable
  (
    id: map['id'],
    name: map['name'],

    posterPath: map['posterPath'],
    overview: map['overview'],
  );

  Map<String, dynamic> toJson() 
  => 
  {
    'id': id,
    'name': name,
    
    'posterPath': posterPath,
    'overview': overview,
  };

  Tvclil toEntity() 
  => Tvclil.watchlist(
    id: id,
    overview: overview,
    
    posterPath: posterPath,
    name: name,
  );

  @override

  List<Object?>
  get props =>
  [id, name, posterPath, overview];
}