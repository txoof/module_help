// openscad help module
//use the format: module help_LIBRARYNAME(modName = false) {}
module help_YourLibraryNameHere(modName = false) {
  //edit content below this line
  modules = 
            [["example",
              "module/function: name(param1 = <data type>, param2 = <data type>, param3 = <data type>)",
              "returns: function return values/none for modules",
              "Description: basic description of function/module",
	      "Paramaters:",
              "     param1       <data type>   explanation of paramater",
              "     param2       <data type>   explanation of paramater"],

             ["module1",
              "module/function: ",
              "returns: ",
              "Description: ",
              "Paramaters: ",
              "      param1     <data type>   explanation",
              ],
            ];
  //End editable content
  //DO NOT EDIT BELOW THIS POINT

  //convert string into a vector to make search work properly
  modVect = [modName];
  //use the vectorized string to search the modules vector
  index = search(modVect, modules)[0];

  //chcek if a name was passed
  if (modName==false || len(modules[index])==undef) {
      if (len(modules[index])==undef && modName != false) {
        echo(str("*****Module: ", modName, " not found*****"));
        echo("");
      }     

      echo("Available Help Topics in this Library:");
      for (i=[0:len(modules)-1]) {
        echo(modules[i][0]);
      }
      echo("USE: help_mod(\"moduleName \")  ");
      //assert(modName);
    } else {
      //return the first matching entry
      //-possibly modify this to return all entries - allows partial match

      echo(str("Help for module/function: ", modName));
      //basic = modules[index[0]][1];
      //echo(basic);
      for (text=[1:len(modules[index])-1]) {
        echo(modules[index][text]);
      }
    }

  echo("see this file for a blank example");
}



module help_mod(modName = false) {
  modules = [["example",
              "module/function: name(param1 = <data type>, param2 = <data type>, param3 = <data type>)",
              "returns: function return values/none for modules",
              "Description: basic description of function/module",
	      "Paramaters:",
              "     param1       <data type>   explanation of paramater",
              "     param2       <data type>   explanation of paramater"],

             ["hollowSphere",
              "module: hollowSphere(outRad = <real>, inRad = <real>)",
              "returns: none (module)",
              "Description: creates a hollow sphere with outRad radius and a hollow volume with inRad radius",
              "Paramaters:",
              "     outRad       <real>        outter radius of sphere",
              "     inRad        <real>        inner radius of hollow sphere"
             ],
             ["bezierLine",
              "function: bezierLine(step = <real>, controlPoints = <vector>)",
              "returns: <vector of vectors>",
              "Description: returns a vector of points along a calculated bezier curve",
              "Paramaters:",
              "     step           <real>      step size across bezier curve",
              "     controlPoints  <vector>    [[x0,y0], [x1,y1], [x2,y2], [x3,y3]]"
             ],

            ];

  //convert string into a vector to make search work properly
  modVect = [modName];
  //use the vectorized string to search the modules vector
  index = search(modVect, modules)[0];

  //chcek if a name was passed
  if (modName==false || len(modules[index])==undef) {
      if (len(modules[index])==undef && modName != false) {
        echo(str("*****Module: ", modName, " not found*****"));
        echo("");
      }     

      echo("Available Help Topics in this Library:");
      for (i=[0:len(modules)-1]) {
        echo(modules[i][0]);
      }
      echo("USE: help_mod(\"moduleName \")  ");
      //assert(modName);
    } else {
      //return the first matching entry
      //-possibly modify this to return all entries - allows partial match

      echo(str("Help for module/function: ", modName));
      //basic = modules[index[0]][1];
      //echo(basic);
      for (text=[1:len(modules[index])-1]) {
        echo(modules[index][text]);
      }
    }

  echo("see this file for a blank example");
}




help_mod("");

