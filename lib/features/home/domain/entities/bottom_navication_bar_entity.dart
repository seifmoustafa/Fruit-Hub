import 'package:fruit_hub/core/utils/app_images.dart';

class BottomNavicationBarEntity {
  final String activeImage, inActiveImage, name;

  BottomNavicationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavicationBarEntity> get bottomNavigationBarList => [
      BottomNavicationBarEntity(
          activeImage: Assets.imagesVuesaxBoldHome,
          inActiveImage: Assets.imagesVuesaxOutlineHome,
          name: 'الرئيسية'),
      BottomNavicationBarEntity(
          activeImage: Assets.imagesVuesaxBoldProducts,
          inActiveImage: Assets.imagesVuesaxOutlineProducts,
          name: 'المنتجات'),
      BottomNavicationBarEntity(
          activeImage: Assets.imagesVuesaxBoldShoppingCart,
          inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
          name: 'سلة التسوق'),
      BottomNavicationBarEntity(
          activeImage: Assets.imagesVuesaxOutlineUser,
          inActiveImage: Assets.imagesVuesaxOutlineUser,
          name: 'حسابي '),
    ];
