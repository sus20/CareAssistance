import 'package:refresh/models/PersonData.dart';

class RefinePersonData {
  static bool isMale(int index) {
    return PersonData.personList.elementAt(index).containsValue("male");
  }

  static bool isFemale(int index) {
    return PersonData.personList.elementAt(index).containsValue("female");
  }

  static bool isInInnerhalb(int index, int distance) {
    return (int.parse(
            PersonData.personList.elementAt(index)["distanceFromCityCenter"]) <
        distance);
  }

  static bool isAroundAlt(int index, int age) {
    return int.parse(PersonData.personList.elementAt(index)["age"]) >  (age - 5) &&
    int.parse(PersonData.personList.elementAt(index)["age"]) < (age + 5);
  }

  static bool refineDataBasedOnOptions(
      i, _checkBox1, _checkBox2, _checkBox3, _checkBox4, km, age) {
    List<bool> personSelectedWRTCheckBox = [];
    bool isPersonSelected = true;

    if (_checkBox1 && _checkBox2)
      personSelectedWRTCheckBox.add(true);
    else {
      if (_checkBox1) personSelectedWRTCheckBox.add(isMale(i));
      if (_checkBox2) personSelectedWRTCheckBox.add(isFemale(i));
    }

    if (_checkBox3) personSelectedWRTCheckBox.add(isInInnerhalb(i, km));
    if (_checkBox4) personSelectedWRTCheckBox.add(isAroundAlt(i, age));

    for (int j = 0; j < personSelectedWRTCheckBox.length; j++) {
      isPersonSelected = isPersonSelected && personSelectedWRTCheckBox[j];
    }

    if (personSelectedWRTCheckBox.length == 0) return false;
    return isPersonSelected;
  }
}
