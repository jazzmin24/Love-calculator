import 'dart:collection';

calculation({String? firstName, String? secondName}) {
  int finalscore;
  List<String> firstList = firstName!.split('');
  List<String> secondList = secondName!.split('');
  //print(firstList);

  List<String> magicWord = firstList + "loves".split('') + secondList;
  print(magicWord);
  var nameMap = new Map();              //new map declared
  magicWord.forEach((f) {
    nameMap.containsKey(f) ? nameMap[f]++ : nameMap[f] = 1;
  });

  print(nameMap.values);

  List magicCode = nameMap.values.toList();
  print(magicCode);
  List score;
  while (magicCode.length > 2) {
    score = _calculate(magicCode);          //function called in line 31
    magicCode = score;
    print(score);
  }
  finalscore = magicCode[0] * 10 + magicCode[1];
  print(finalscore);
  return finalscore;
}

List _calculate(List magicCode) {
  int countSum;
  List score = [];
  do {
    countSum = magicCode.first + magicCode.last;
    if (countSum > 9) countSum -= 9;
    score.add(countSum);
    magicCode.removeLast();
    magicCode.removeAt(0);
  } while (magicCode.length >= 2);
  print(magicCode);
  if (magicCode.isNotEmpty) {
    score.add(magicCode.first);
  }
  return score;
}
