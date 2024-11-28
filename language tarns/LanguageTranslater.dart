import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ['Hindi' , 'Telugu' , 'English'];
  var originlanguage = 'from';
  var destinationlanguage = 'to';
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src , String dest , String input)async{
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input,from: src,to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if(src=='--' || dest=='--'){
      setState(() {
        output = 'Failed to Translate';
      });
    }
  }

  String getLanguageCode(String language){
    if(language == 'English'){
      return 'en';
    }else if(language == 'Hindi'){
      return 'hi';
    }else if(language == 'Telugu'){
      return 'te';
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Language Translator" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),
        ),centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black54,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      focusColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(
                        originlanguage,style: const TextStyle(color: Colors.white),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: languages.map((String dropdownstringitem){
                        return DropdownMenuItem(value: dropdownstringitem,child: Text(dropdownstringitem) ,);
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          originlanguage = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 30,),

                    const Icon(Icons.arrow_right_alt_outlined,color: Colors.white  , size: 40 ,),

                    const SizedBox(height: 30,),

                    DropdownButton(
                      focusColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(
                        destinationlanguage,style: const TextStyle(color: Colors.white),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: languages.map((String dropdownstringitem){
                        return DropdownMenuItem(value: dropdownstringitem,child: Text(dropdownstringitem) ,);
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          destinationlanguage = value!;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    autofocus: false,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Enter your text',
                      labelStyle: const TextStyle(fontSize: 20,color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1
                        )
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      errorStyle: const TextStyle(fontSize: 20 , color: Colors.red),
                    ),
                    controller: languageController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter text to translator';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: (){
                        translate(getLanguageCode(originlanguage), getLanguageCode(destinationlanguage), languageController.text.toString());
                  }, child: const Text('Translate')),
                ),
                const SizedBox(height: 40,),
                Text(
                  "\n$output" ,style: const TextStyle(fontSize: 30 ,color: Colors.white,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}