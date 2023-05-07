import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipley_assignment/UIPages/ReUseWidgets/default_circular_progress_indicator.dart';
import 'package:recipley_assignment/src/colors.dart';
import 'package:recipley_assignment/src/screen_sizes.dart';
import 'package:provider/provider.dart';

import '../../src/assets_string.dart';

class GetNetWorkImage extends StatelessWidget {
  final String? image;
  final String? baseUrl;
  final double? size,width;
  final double? radius;
  final bool? isUserLive;
  final bool? showLiveIcon;
  final BoxShape? boxShape;
  final BoxFit? boxFit;
  final int? borderColor,backgroundColor;
  final bool? withBorder;
  final bool? vintageImage;
  const GetNetWorkImage({this.showLiveIcon,this.isUserLive,this.width,this.vintageImage,this.backgroundColor,this.borderColor,this.withBorder,this.boxFit,this.boxShape = BoxShape.circle,this.radius,this.size,this.baseUrl,required this.image,Key? key}) : assert(boxShape == BoxShape.rectangle||boxShape == BoxShape.circle,'If boxShape is rectangle then set radius too'), super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      vintageImage==true?Stack(
        children: [
          NowImage(showLiveIcon:showLiveIcon,isUserLive:isUserLive,width: width,image: image,vintageImage: vintageImage,backgroundColor:backgroundColor,borderColor:borderColor,withBorder:withBorder,boxFit:boxFit,boxShape:boxShape,radius:radius,size:size,baseUrl:baseUrl),
          Container(
            height: ScreenSize().heightOnly(size??7),
            width: width??ScreenSize().heightOnly(size??7),
            decoration: BoxDecoration(
                shape: boxShape==BoxShape.rectangle?BoxShape.rectangle:BoxShape.circle,
                borderRadius: boxShape==BoxShape.rectangle?BorderRadius.all(Radius.circular(radius??15)):null,
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(MyColor.colorBlack).withOpacity(0.2),
                    const Color(MyColor.colorBlack).withOpacity(0.1)
                  ]
              )
            ),
          )
        ],
      ):
      NowImage(showLiveIcon:showLiveIcon,isUserLive:isUserLive,width: width,image: image,vintageImage: vintageImage,backgroundColor:backgroundColor,borderColor:borderColor,withBorder:withBorder,boxFit:boxFit,boxShape:boxShape,radius:radius,size:size,baseUrl:baseUrl);
  }
}
class NowImage extends StatelessWidget {
  final String? image;
  final String? baseUrl;
  final double? size,width;
  final double? radius;
  final bool? isUserLive;
  final bool? showLiveIcon;
  final BoxShape? boxShape;
  final BoxFit? boxFit;
  final int? borderColor,backgroundColor;
  final bool? withBorder;
  final bool? vintageImage;
  const NowImage({this.showLiveIcon,this.isUserLive,this.width,this.vintageImage,this.backgroundColor,this.borderColor,this.withBorder,this.boxFit,this.boxShape = BoxShape.circle,this.radius,this.size,this.baseUrl,required this.image,Key? key}) : assert(boxShape == BoxShape.rectangle||boxShape == BoxShape.circle,'If boxShape is rectangle then set radius too'), super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width:width??ScreenSize().heightOnly(size??7),
      height: ScreenSize().heightOnly(size??7),
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: baseUrl!=null?'$baseUrl$image':image??'',
              imageBuilder: (context, imageProvider) => Container(
                  width:width??ScreenSize().heightOnly(size??7),
                  height: ScreenSize().heightOnly(size??7),
                  decoration: BoxDecoration(
                    shape: boxShape==BoxShape.rectangle?BoxShape.rectangle:BoxShape.circle,
                    color: Color(backgroundColor??MyColor.colorGreyLight),
                    borderRadius: boxShape==BoxShape.rectangle?BorderRadius.all(Radius.circular(radius??15)):null,
                    border: withBorder==true?Border.all(
                        width: 0.8,
                        color: Color(borderColor??MyColor.colorWhite)
                    ):null,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: boxFit??BoxFit.cover,
                    ),
                  )
              ),
              placeholder: (context, url) => Container(
                width:width??ScreenSize().heightOnly(size??7),
                height: ScreenSize().heightOnly(size??7),
                decoration: BoxDecoration(
                  shape: boxShape==BoxShape.rectangle?BoxShape.rectangle:BoxShape.circle,
                  color: Color(backgroundColor??MyColor.colorGreyLight),
                  borderRadius: boxShape==BoxShape.rectangle?BorderRadius.all(Radius.circular(radius??15)):null,
                  border: withBorder==true?Border.all(
                      width: 0.8,
                      color: Color(borderColor??MyColor.colorBlack)
                  ):null,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(boxShape==BoxShape.rectangle?(radius??15):100)),
                    child: const Center(child: DefaultCircularProgress())
                ),
              ),
              errorWidget: (context, url, error) => Container(
                  width: width??ScreenSize().heightOnly(size??7),
                  height: ScreenSize().heightOnly(size??7),
                  decoration: BoxDecoration(
                    shape: boxShape==BoxShape.rectangle?BoxShape.rectangle:BoxShape.circle,
                    color: Color(backgroundColor??MyColor.colorGreyLight),
                    borderRadius: boxShape==BoxShape.rectangle?BorderRadius.all(Radius.circular(radius??15)):null,
                    border: withBorder==true?Border.all(
                        width: 0.8,
                        color: Color(borderColor??MyColor.colorBlack)
                    ):null,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(boxShape==BoxShape.rectangle?(radius??15):100)),
                    child: Image.asset(GetAssets.avatar,fit: BoxFit.cover,
                    ),
                  )
              )
          ),
          if(showLiveIcon==true)...[
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: ScreenSize().heightOnly(1.4),
                width: ScreenSize().heightOnly(1.4),
                margin: EdgeInsets.fromLTRB(0, 0, ScreenSize().heightOnly(0.2), ScreenSize().heightOnly(0.2)),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(MyColor.colorWhite)
                ),
                child: Padding(
                  padding: EdgeInsets.all(ScreenSize().heightOnly(0.2)),
                  child: ClipOval(
                    child: Material(
                        color: Color(isUserLive==true?MyColor.colorPrimary:MyColor.colorGreyLight)
                    ),
                  ),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
