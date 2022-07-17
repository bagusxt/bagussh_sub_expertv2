import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:sub_bagussh/common/constants.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/presentation/pages/tvclil_detail_page.dart';


class 
  TvclilCard 

extends 
  StatelessWidget {

final 
  Tvclil tv;

  TvclilCard(this.tv);

  @override
  Widget build(BuildContext context) {
    return Container(  margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            TvclilDetailPage.ROUTE_NAME,
            arguments: tv.id,
          );
        },
        child: Stack(
          alignment: 
          Alignment.bottomLeft,
          children: [
            Card(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,  bottom: 8,   right: 8,

                ),
                child: Column( crossAxisAlignment: 
                  CrossAxisAlignment.start,
                  children: [Text(  tv.name ?? '-',  maxLines: 1, overflow: 
                      TextOverflow.ellipsis,
                      style: kHeading6,
                    ),
                    SizedBox(height: 16),
                    Text(  tv.overview ?? '-', maxLines: 2, overflow: 
                    TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: 
              ClipRRect(
                child: 
                CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  width: 80,
                  placeholder: (context, url) => Center(
                    child:  CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              borderRadius:  BorderRadius.all(Radius.circular(8)),
             ),
           ),
         ],
      ),
    ),
  );
 }
}