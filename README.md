# ProductPage
An example project that shows how to build a product page in a modular way. SwiftUI practice

# JJUI
This example uses JJUI. JJUI is a package included in this project that provides UIComponents.

## Components

## JJUButton

This UIComponents represent a button with standard look and feel.

<img src="https://user-images.githubusercontent.com/18092648/147785806-84e09eff-954e-4134-98aa-bb7cc88b1865.png" width="200" height="400" />

### Example

```
struct ContentView: View {


    var body: some View {

      JJUIButton(text: "Primary",
                 icon: nil,
                 configuration: config,
                 state: $buttonState) { }
   }
}
```
