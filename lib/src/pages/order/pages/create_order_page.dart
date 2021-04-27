import 'package:van_transport/src/common/style.dart';
import 'package:van_transport/src/pages/order/widgets/add_product_card.dart';
import 'package:van_transport/src/pages/order/widgets/product_order_card.dart';
import 'package:van_transport/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CreateOrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mCL,
        elevation: .0,
        centerTitle: true,
        leadingWidth: 62.0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            color: colorTitle,
            size: width / 16.5,
          ),
        ),
        title: Text(
          'createOrder'.trArgs(),
          style: TextStyle(
            color: colorTitle,
            fontSize: width / 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
      ),
      body: Container(
        color: mCL,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50.0),
                  ),
                  color: mCM.withOpacity(.85),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                          return true;
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 12.5,
                            right: 12.5,
                            top: 16.0,
                          ),
                          physics: ClampingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return index == 2
                                ? GestureDetector(
                                    onTap: () => Get.toNamed(Routes.ADDPRODUCT),
                                    child: AddProductCard(),
                                  )
                                : ProductOrderCard();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomCheckout(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCheckout(context) {
    return Container(
      color: mCM,
      child: Neumorphic(
        padding: EdgeInsets.fromLTRB(32.0, 32.0, 24.0, 32.0),
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.vertical(
              top: Radius.circular(30.0),
            ),
          ),
          depth: -20.0,
          intensity: .6,
          color: mCH.withOpacity(.12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Product:\t\t',
                    style: TextStyle(
                      color: colorDarkGrey,
                      fontSize: width / 24.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '2',
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: width / 20.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            NeumorphicButton(
              onPressed: () => Get.toNamed(Routes.PICKADDRESS),
              duration: Duration(milliseconds: 200),
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(20.0),
                ),
                depth: 15.0,
                intensity: 1,
                color: colorPrimary.withOpacity(.85),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 28.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: mC,
                    size: width / 18.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'pickAddress'.trArgs(),
                    style: TextStyle(
                      color: mC,
                      fontSize: width / 26.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}