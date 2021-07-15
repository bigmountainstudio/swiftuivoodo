![header](https://user-images.githubusercontent.com/24855856/125707312-e36cb673-6c42-4d21-94a2-59028d3d14b0.png)


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


# OO is for ObservableObject
This is a class that inherits from ObservableObject.
* It can be used to notify your view when data values change.
* When data changes, your view will update.
* Data can be simple, like a string or int. Data can also be an object, like a struct.


# DO is for Data Object
This is usually a structthat holds data.
* You can have one data object in your ObservableObject.
* You can have an array of data objects in your ObservableObject.
* Your ObservableObject can send data objects to your view to be displayed.
