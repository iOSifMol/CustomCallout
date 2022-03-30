# CustomCallout
A small project explining how to use the MapKit custop callout by implementing two different appraoches.

# 1. Subclass `MKPinAnnotationView` approach
This is a simple appraoch to implement a custom callout. The only downside, it is ussing the old pin style. Here is how it looks:
![first](https://user-images.githubusercontent.com/31770066/160766967-2c4ad69a-9686-47ef-9f58-580c9861a2d1.gif)

# 2. Implement `viewForAnnotation` delegate method
This apprach has both benefits of beeing simple and also gets the naite pinning style with all its annimations, it looks like this:
![second](https://user-images.githubusercontent.com/31770066/160767342-5a443595-2732-4ca6-9c74-8999d1f8c446.gif)
