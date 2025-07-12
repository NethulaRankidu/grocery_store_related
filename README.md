# Grocery Store Related Files
## My folder structure
```
grocery_project
├───build   // This is ignored by .gitignore
├───dist    // This too, is ignored by .gitignore
│   ├───custom-runtime      // Post the custom-runtime as this after the build is done 
│   ├───lib // Libraries will be included here after clean and build
│   └───GroceryStore.jar    // Where our jar exists
├───nbproject
├───src     // Our project basically lives here
│   ├───backend // Backend parts
│   ├───gui     // GUI parts (though some backend parts exist here too)
│   └───reports // .jasper reports
└───test
```
## Command I used to export into .exe
Note: This is _executed in /dist after clean and building the source_
Note: You will need [WiX Toolset](https://github.com/wixtoolset/wix/releases/download/v6.0.1/wix-cli-x64.msi) for making the .exe (Add the directly of installation to PATH after installing WiX Toolset)

Run this:
```
jpackage --name GroceryStore --input . --main-jar grocery_store.jar --runtime-image custom-runtime --type exe --main-class gui.DashBoard --win-dir-chooser --win-shortcut --win-menu --verbose
```