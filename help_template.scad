module help_YourLibraryNameHere(modName = false) {
//for more information see https://github.com/txoof/module_help
//created by Aaron Ciuffo
  //edit content below this line

  //add library name here
  LibraryName = "LIBRARYNAME";

  //enter module and function information here
  modules =
            [["example",
              "module or function: name(param1 = <data type>, param2 = <data type>, param3 = <data type>)",
              "returns: function return values/none for modules",
              "Description: basic description of function/module",
              "Parameters:",
              "     param1       <data type>   explanation of paramater",
              "     param2       <data type>   explanation of paramater"],

             ["module1",
              "module/function: ",
              "returns: ",
              "Description: ",
              "Parameters: ",
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
        echo(str(" ", modules[i][0]));
      }
      echo(str("USE: help_",LibraryName,"(\"moduleName\")  "));
      //assert(modName);
    } else {
      //return the first matching entry
      //-possibly modify this to return all entries - allows partial match

      echo(str("Help for module or function: ", modName));
      //basic = modules[index[0]][1];
      //echo(basic);
      for (text=[1:len(modules[index])-1]) {
        echo(modules[index][text]);
      }
    }
}
