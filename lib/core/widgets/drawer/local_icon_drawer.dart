import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/app_images.dart';
import '../../themes/app_Colors.dart';
import '../../themes/app_text_styles.dart';

class LocalIconDrawer extends StatelessWidget {
  LocalIconDrawer({
    super.key,
    required this.title,
    required this.imageIcon,
    required this.items,

  });

  final List<String> items;

  final valueListenable = ValueNotifier<String?>(null);
  final String title;
  final String imageIcon;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ImageIcon(
              AssetImage(imageIcon),
              size: 24,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 8),
            Text(title, style: AppTextStyles.b700Drawer),
          ],
        ),
        SizedBox(height: 10),

        Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: AppColors.primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                iconStyleData: IconStyleData(
                    icon: ImageIcon(AssetImage(AppImages.arrow_down_icon),color:AppColors.primaryColor ,)
                ),
                hint: Text(
                    changeSubTitle(context),
                    style: AppTextStyles.b700Drawer
                ),

                items: items
                    .map(
                      (String item) => DropdownItem<String>(
                    value: item,
                    height: 40,
                    child: Text(
                        item,
                        style:  AppTextStyles.b700Drawer
                    ),
                  ),
                )
                    .toList(),

                valueListenable: valueListenable,
                onChanged: (String? value) {
                  if (value == null) return;
                  valueListenable.value = value;
                  changeLocalization(context,"$value");
                },

                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 140,
                //  elevation: 10,
                ),

                  dropdownStyleData: DropdownStyleData(
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border:Border.all(width:1,color: Colors.white30),
                      color: AppColors.primaryColorDark,
                    ),
                  ),

                  dropdownSeparator:DropdownSeparator(
                    height: 10,
                      child: Divider(
                        color: Colors.white30,
                      ))

              ),
            )
          ),
        ),


      ],
    );
  }
  void changeLocalization(BuildContext context,String value){
    if(value=="English"){
       context.setLocale(Locale('en'));
    }
    else{
       context.setLocale(Locale('ar'));
    }
  }
  String changeSubTitle(BuildContext context){
    if(context.locale.languageCode=="en"){
      return "English";
    }
   else if(context.locale.languageCode=="ar"){
     return "العربية" ;
    }
   else{
     return "English" ;
    }
  }
}
