![header](https://user-images.githubusercontent.com/24855856/125718166-b660e276-da1f-43f7-999f-fec5e5c54410.png)


# Simply Separated
There are only 3 parts:
1. View
2. ObservableObject
3. DataObject

Not all are required.
And you can expand beyond these 3 for your apps needs.
Strive for simplicity.

# V is for View
This is your SwiftUI view.
* It may or may not show any data.
* In SwiftUI, if you want to change the way your view looks, you will have to change some data.
* Data can be within the view. Data can be within an ObservableObject.


# OO is for Observable Object
This is a class that inherits from ObservableObject.
* It can be used to notify your view when data values change.
* When data changes, your view will update.
* Data can be simple, like a string or int. Data can also be an object, like a struct.


# DO is for Data Object
This is usually a struct that holds data.
* You can have one data object in your ObservableObject.
* You can have an array of data objects in your ObservableObject.
* Your ObservableObject can send data objects to your view to be displayed.

------------

# Code Example
### View
```swift
struct SettingsView: View {
    @StateObject private var oo = SettingsOO()
    
    var body: some View {
        List(oo.data) { datum in
            Text(datum.name)
        }
        .onAppear {
            oo.fetch()
        }
    }
}
```

### Observable Object
```swift
class SettingsOO: ObservableObject {
    @Published var data: [DataObject] = []
    
    func fetch() {
        data = [DataObject(name: "Datum 1"),
                DataObject(name: "Datum 2"),
                DataObject(name: "Datum 3")]
    }
}
```

### Data Object
```swift
struct DataObject: Identifiable {
    let id = UUID()
    var name: String
}
```

### Preview
![preview](https://user-images.githubusercontent.com/24855856/125803759-38e60661-f754-48dc-8b29-ecae855c0e74.png)

# Important Notes
## You are in control!
![in control](https://user-images.githubusercontent.com/24855856/126043468-d2607fdc-cb57-4282-9592-a1af524c29fd.jpeg)

* You decide on the naming convention you want to use.
    * You can update the Xcode file template below to fit your needs.
* You decide how simple or how complex this needs to be.
    * Don't need the Data Object? Delete it!
    * Want to put the observable object and view in the same file? Go for it!
    * Want all 3 in separate files but the same folder? Why not?

## How is this different from other architectures?
The goal of architecture is to make your life (or your team's life) easier.
If this is not happening, then your architecture has failed.

### This architecture is meant to:
* Provide a starting point
* Be flexible
* Be as simple or as complicated as you need
* Have fewer rules
* Allow the developer to **use their judgment**
* Grow with your project. 

Let's talk about that last point...

### Grow With Your Project - Example 1
1. Minimum Viable Project
    1. Maybe you used that Xcode file template below and your view, observable object, and data object are in one file. Simple.
    1. You present your minimum viable product (MVP) to the world.
    1. People like it! You notice they're asking for more features. 🙌
1. Project Growth
    1. You add a new view. It uses the same data object as the previous view.
    1. Duplicating the same data object is a bad idea. So you create a folder called **`Data Objects`** and put it in its own file.
    1. Now both views and observable objects are using the same data object.

The idea is you **use your judgment** on how you want to break it out and organize it.

![swiftui voodo architecture growth example 1](https://user-images.githubusercontent.com/24855856/126044175-ee822d8a-931e-49f4-b056-63096926739d.png)


Let's look at a different scenario.

### Grow With Your Project - Example 2
1. You decide to structure your project so the view, observable object, and data object are in separate files but all in the same folder so you can more easily work with all the related parts.
2. Later, you find out that the `MainDO` (Main data object) can be reused in another view. 
3. So you create a **`CommonDataObjects`** folder and move `MainDO.swift` into it.

![swiftui voodo architecture growth example 2](https://user-images.githubusercontent.com/24855856/126044355-f5b05c72-c921-43f4-881f-15a237020ed4.png)

The choice is yours. **You are in control!**

### Separate Folders
You can also start your project with a traditional separation of parts with separate folders:

![swiftui voodo architecture growth example 3](https://user-images.githubusercontent.com/24855856/126044212-eabde7b9-7353-4995-ba5b-d01ba11304ba.png)

In this scenario, Settings doesn't need a data object so one isn't created.

Remember the goal of architecture: **To make your life easier.**
Do what you have to with your architecture to keep making your life easier, not harder.


------------
# Iterate Architecture Organization
Pick one VOODO folder/file strategy and try it. I would suggest picking what you think is the simplest one for yourself.

After a while, if you find yourself taking a long time moving between parts or having a hard time finding objects, then reorganize and simplify to make your life easier.

That is the goal of architecture: **To make your life easier.**

------------
# Resources
### Working with Data in SwiftUI
Learn more about this architecture and working with data in the book **Working with Data in SwiftUI**.

![working with data in swiftui](https://user-images.githubusercontent.com/24855856/125804293-5f4ec808-220d-41a7-b1ce-9caebc06069e.png)

[Learn More](https://www.bigmountainstudio.com/data)



### Xcode File Template
![xcode file template](https://user-images.githubusercontent.com/24855856/125811407-ebf6e72f-ee03-4afd-9b46-992ea81202f6.png)

This file template will create all 3 objects when you add a new SwiftUI view to your project.

[Download Here](https://github.com/bigmountainstudio/VOODOFileTemplate)

Note: All 3 objects will be in one file. 
This is meant to be a STARTING POINT.
Delete what you don't need and separate out what you want OR keep everything in one file. 
### Remember, YOU are in control.
