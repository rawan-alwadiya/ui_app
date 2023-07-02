import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp_16_ui_app/models/app_category.dart';
import 'package:vp_16_ui_app/models/country.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _notifications = false;
  RangeValues priceRangeValues = const RangeValues(50, 150);

  String? _gender;

  int? _countryId;

  List<String> _experiences = <String>[];

  late TextEditingController _experienceTextController;

  //Categories List
  final List<AppCategory> _categories = <AppCategory>[
    AppCategory(title: 'Polo'),
    AppCategory(title: 'H&M'),
    AppCategory(title: 'Zara'),
    AppCategory(title: 'Adidas'),

  ];

  //Countries List
  final List<Country> _countries = <Country>[
    const Country(id: 1, title: 'Palistine'),
    const Country(id: 2, title: 'Egypt'),
    const Country(id: 3, title: 'Moroco'),
    const Country(id: 4, title: 'Jordan'),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _experienceTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _experienceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      children: [
        SwitchListTile(
          activeColor: Colors.pink,
          activeTrackColor: Colors.blue.shade300,
          inactiveThumbColor: Colors.grey.shade300,
          inactiveTrackColor: Colors.pink.shade100,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Notifications',
            style: GoogleFonts.montserrat(),
          ),
          subtitle: Text(
              'Turn Notifications On/Off',
            style: GoogleFonts.montserrat(),
          ),
          value: _notifications,
          onChanged: (bool value){
            setState(()=> _notifications = value);
          },
        ),
        //Section-1: Price Range
        const SizedBox(height: 15,),
        Text(
          'Price Range',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        RangeSlider(
          min: 1,
          max: 300,
          labels: RangeLabels(
            priceRangeValues.start.toString(),
            priceRangeValues.end.toString(),
          ),
          divisions: 10,
          activeColor: Colors.pink.shade300,
          inactiveColor: Colors.blue.shade300,
          values: priceRangeValues,
          onChanged: (RangeValues values){
            setState(()=> priceRangeValues = values);
          },
        ),
        //Section-2: Gender
        const SizedBox(height: 15,),
        Text(
          'Gender',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Male'),
                  value: 'M',
                  groupValue: _gender,
                  onChanged: (String? value){
                    setState(()=> _gender = value);
                  },
              ),
            ),
            Expanded(
                child: RadioListTile<String>(
                  activeColor: Colors.pink.shade100,
                  title: const Text('Female'),
                  value: 'F',
                  groupValue: _gender,
                  onChanged: (String? value){
                    setState(()=> _gender = value);
                  },
                ),
            ),
          ],
        ),
        //Section-3: Categories
        const SizedBox(height: 15,),
        Text(
          'Category',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        // _categories.map((category) => Text('')).toList()
        for(AppCategory category in _categories)
        CheckboxListTile(
          activeColor: Colors.pink.shade300,
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          checkColor: Colors.blue.shade100,
          title: Text(category.title),
            value: category.checked,
            onChanged: (bool? value){
            if(value!= null){
              setState(()=> category.checked = value);
            }
            },
        ),
        //Section-4: Country
        const SizedBox(height: 15,),
        Text(
          'Country',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        DropdownButton<int>(
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Colors.grey.shade200,
          onTap: (){},
          hint: const Text('Select Country'),
          items: _countries.map((country){
            return DropdownMenuItem<int>(
              value: country.id,
              child: Text(country.title),
            );
          }).toList(),
          // underline: Divider(height: 0,color: Colors.transparent,thickness: 0,),
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
          ),
          itemHeight: 48,
          icon: const Icon(Icons.keyboard_arrow_down_sharp),
          iconSize: 24,
          // elevation: 10,
          value: _countryId,
          onChanged:(int? value){
            setState(()=> _countryId = value);
          },
          selectedItemBuilder: (context){
            return _countries.map((e){
              return Row(
                children: [
                  Text(e.id.toString()+' - '),
                  Text(e.title),
                ],
              );
            }).toList();
          },
        ),
        //Section-5: Experience
        const SizedBox(height: 15,),
        Text(
          'Experiences',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: _experienceTextController,
          style: GoogleFonts.montserrat(),
          maxLength: 20,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          // minLines: null,
          // maxLines: null,
          // expands: true,
          onSubmitted: (String value)=>_performSave(),
          decoration: InputDecoration(
            counterText: '',
            // constraints: BoxConstraints(
            //   maxHeight: 100,
            // ),
            // enabledBorder: OutlineInputBorder(),
            // focusedErrorBorder: OutlineInputBorder(),
            hintText: 'Enter Experience',
            hintStyle: GoogleFonts.montserrat(),
            hintMaxLines: 1,
            prefixIcon: const Icon(Icons.work,size: 18,),
            suffixIcon: IconButton(
              onPressed: ()=>_performSave(),
              icon: const Icon(Icons.save,size: 18,),
            ),
          ),
        ),
        Wrap(
          spacing: 10,
          children: _experiences.map((String experience){
            return Chip(
              label: Text(experience),
              labelStyle: GoogleFonts.montserrat(
                color: const Color(0xFF0F3D3E),
              ),
              avatar: const Icon(
                Icons.work,
                size: 18,
                color: const Color(0xFF0F3D3E),
              ),
              backgroundColor: const Color(0xFFE2DCC8),
              deleteIcon: Icon(Icons.close,size: 18,),
              deleteIconColor: Colors.red.shade400,
              onDeleted: (){
                _deleteExperience(experience);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _deleteExperience(String experience) {
    setState(()=> _experiences.remove(experience));
  }

  void _performSave() {
    if(_checkData()) {
      _save();
    }
  }

  bool _checkData(){
    if(_experienceTextController.text.isNotEmpty){
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: const Text('Enter Required Data!',),
        backgroundColor: Colors.red.shade400,
      ),
    );
      return false;
  }
  void _save(){
    setState(()=> _experiences.add(_experienceTextController.text));
    _experienceTextController.clear();
  }
}
