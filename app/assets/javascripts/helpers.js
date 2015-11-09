function getValue(finderStr, classStr) {
  var index = classStr.indexOf(finderStr) + finderStr.length;
  var id = "";
  var i;
  for( i = 0; 1 == 1 ; i++ ){
    var nextChar = classStr.slice(index+i,(index+1+i));
    if (( nextChar === " " )||(nextChar === "")){
      return id;
    } else {
      id = id + nextChar;
    };
  };
}; 

