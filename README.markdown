# KBHAnimatedLabels

A collection of animated labels. 

## Usage

Any label can be created with `init(frame:text:)` and added to the view hierarchy. The label can then be animated by calling `animate()`. Each label has different customization options, so see the code documentation or the specific usage section below to see what is available.

### KBHLabel

Each animated label inherits from `KBHLabel`. Here are the common custimization properties.
* text
* textColor
* font

### KBHFlippingLabel

![Alt text](https://github.com/keithbhunter/KBHAnimatedLabels/blob/master/Images/Flip.gif "KBHFlippingLabel")

Customization Properties
* direction
* timingFunction
* duration
* numberOfFlips

### KBHSpinningLabel

![Alt text](https://github.com/keithbhunter/KBHAnimatedLabels/blob/master/Images/Spin.gif "KBHSpinningLabel")

Customization Properties
* direction
* timingFunction
* duration
* numberOfSpins

### KBHWaveLabel

![Alt text](https://github.com/keithbhunter/KBHAnimatedLabels/blob/master/Images/Wave.gif "KBHWaveLabel")

Customization Properties
* direction
* damping
* waveHeight

## License

KBHAnimatedLabels is available under the MIT license. See the LICENSE file for more info.