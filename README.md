![header](https://user-images.githubusercontent.com/24855856/125718166-b660e276-da1f-43f7-999f-fec5e5c54410.png)


# Separated Simply
There are only 3 parts:
1. View
2. ObservableObject
3. DataObject

Not all are required.
And you can expand beyond these 3.

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
## View
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

## Observable Object
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

## Data Object
```swift
struct DataObject: Identifiable {
    let id = UUID()
    var name: String
}
```

### Preview
![preview](https://user-images.githubusercontent.com/24855856/125803759-38e60661-f754-48dc-8b29-ecae855c0e74.png)

------------
# Resources
## Working with Data in SwiftUI
![working with data in swiftui](https://user-images.githubusercontent.com/24855856/125804293-5f4ec808-220d-41a7-b1ce-9caebc06069e.png)
[Learn More](https://www.bigmountainstudio.com/data)

