# CallBack Extensions

This repository is to add useful functions to extend UIView's control to increase productivity. This repository includes UIView, UIButton extension class. 

Extension Classes are available inside the Source folder of sample project.

# Benefits

**UIButtonExtension**, will give way to use TapUpInside method without the @IBAction. 
Also, **UITapGestureExtension** will reduce the number of lines code.  

# How to Integrate

1. Add **Source folder** to your project.
2. Now you can use all function which are defined inside the classes.

# Example of Use

```
override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture to view
        // Use [weak self] or [unowned self] to avoid retain cycle.
        self.view.addTapGesture {[unowned self] (gesture) in
            print(gesture.view ?? self.view as Any)
        }
        
        // Use [weak self] or [unowned self] to avoid retain cycle.
        self.lblTappableText.addTapGesture {[unowned self] (gesture) in
            print(self.lblTappableText.text ?? "")
        }
        
        // Use [weak self] or [unowned self] to avoid retain cycle.
        btnSample.callBackTarget {(sender) in
            print(sender.titleLabel?.text ?? "")
        }
    }
