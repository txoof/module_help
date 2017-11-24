// openscad help module
// Aaron Ciuffo  - Reach me at Gmail aaron.ciuffo

/*
Add the module help_YourLibraryNameHere() {} to your OpenSCAD library to provide some
callable help.

Usage from an imported library: 
//provide a list of all help topics in the "colors" library:
use <./libraries/colors.scad>
help_colors();

//output:
ECHO: "Available Help Topics in this Library:"
ECHO: "colorArray"
ECHO: "chord"
ECHO: "RGB"
ECHO: "RGBScale"
ECHO: "red"
ECHO: "redScaled"

//get help on a particular topic from the "colors" library:
help_colors("colorAray");

//output:
ECHO: "Help for module/function: colorArray"
ECHO: "function: colorAray(columns = <integer>, rows = <integer, scaled = <boolean>)"
ECHO: "returns: <vector of vectors>"
ECHO: "Description: returns column X rows vector of interpolated RGB values"
ECHO: "Parameters:"
ECHO: "     columns      <integer>   1-255 columns"
ECHO: "     rows         <integer>   1-255 rows"
ECHO: "     scaled       <boolean>   scale the colors from white to full color"


The model library included below requires a library name and a vector containing specific
help information. See the examples below:

//Examples

LibraryName = "Name of your library";

modules = [
           ["nameOfModuleOrFunction", //callable name of module
            // module/function: callable name of function (paramater1 = <data type>)
            "module: nameOfModuleOrFunction(param1 = <data type>"),
            //returns: description of return OR none (module)
            "returns: none (module)",
            //description of function
            "Description: This module does things",
            //Parameters: - list of paramaters, data types and an explanation of use
            "Parameters: ",
            //paramater one
            "     radius        <real>      radius of bolt head"
            //paramter two
            "     number        <integer>   number of objects to draw"
           ], //following modules can be described using the same format
          ];

*/

help_mod_demo();
echo("");
help_mod_demo("exampleModule");
echo("");
help_mod_demo("hollowSphere");


//use the format: module help_LIBRARYNAME(modName = false) {}
module help_YourLibraryNameHere(modName = false) {
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
        echo(modules[i][0]);
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



module help_mod_demo(modName = false) {
  
  LibraryName = "help_mod_demo";
  
  modules = [["exampleModule",
              "module/function: name(param1 = <data type>, param2 = <data type>, param3 = <data type>)",
              "returns: function return values/none for modules",
              "Description: basic description of function/module",
	      "Parameters:",
              "     param1       <data type>   explanation of paramater",
              "     param2       <data type>   explanation of paramater"],

             ["hollowSphere",
              "module: hollowSphere(outRad = <real>, inRad = <real>)",
              "returns: none (module)",
              "Description: creates a hollow sphere with outRad radius and a hollow volume with inRad radius",
              "Parameters:",
              "     outRad       <real>        outter radius of sphere",
              "     inRad        <real>        inner radius of hollow sphere"
             ],
             ["bezierLine",
              "function: bezierLine(step = <real>, controlPoints = <vector>)",
              "returns: <vector of vectors>",
              "Description: returns a vector of points along a calculated bezier curve",
              "Parameters:",
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
      echo(str("USE: help_",LibraryName,"(\"moduleName\")  "));
      //echo(str("USE: help_mod(\"", LibraryName, "\")  "));
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

  echo("see this file for a blank example");
}




