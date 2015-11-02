# KBHAnimatedLabels

A collection of animated labels. 

## KBHFlippingLabel

![Alt text](https://github.com/keithbhunter/KBHAnimatedLabels/blob/master/Images/Flip.gif "KBHFlippingLabel")

The label can be created with the following code and then animated with `animateForDuration()`. An example implementation would be to subclass `KBHFlippingLabel` and override `touchesBegan(_, withEvent:)` to animate the label anytime the label is touched.

```
let flippingLabel = KBHFlippingLabel(frame: /* Some frame */, text: "Some Text")
flippingLabel.textColor = .whiteColor()
flippingLabel.font = .boldSystemFontOfSize(24)
flippingLabel.direction = .Horizontal
view.addSubview(flippingLabel)
``` 

## KBHSpinningLabel

![Alt text](https://github.com/keithbhunter/KBHAnimatedLabels/blob/master/Images/Spin.gif "KBHSpinningLabel")

Similar creation and animation to `KBHFlippingLabel`.

```
let spinningLabel = SpinningLabel(frame: /* Some Frame */, text: "Some Text")
spinningLabel.textColor = .whiteColor()
spinningLabel.font = .boldSystemFontOfSize(24)
spinningLabel.direction = .Right
view.addSubview(spinningLabel)
``` 

## License

KBHAnimatedLabels is available under the MIT license. See the LICENSE file for more info.