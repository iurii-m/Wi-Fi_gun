# The Wi-Fi Gun Project

The project was inspired by the Kreosan youtube video:
https://www.youtube.com/watch?v=s-MKhffuPzM&vl=en
However it is not the origin of the design.

## Antenna assembling
The real design copy the one from the source video as proved to be well working one.

![Antenna_photo](/data/photo/ph1.jpg| heigth=100)

The S11 of the antenna was measured on the Rohde & Schwarz VNA.

![S11_real_antenna](/data/images/WIFI_Gun_default__parameters_V2.png){:height="50%" width="50%"}

## Modeling in CST

For the convinient modeling and repeatability the design was combined into a macros with VBA language.
Macros construct the antenna design and also define optimisation goal (explained below).
All published cst models use the developped macros. Only the geomertic parameters vary for different models.  
To make macros available in CST put in into:
<CST folder>/Library/Macros/Construct/<create some folder>/

###### Comparison of modeling and real antenna
The S11 of simulated model was compared with the real measurements. Results on the frequencies of interest are almost the same. 

![S11_Comparison](/data/images/Compare_CST_VNA.png){:height="50%" width="50%"}

###### Optimisation
Macros also define optimisation goal - achieving the S11 not greater that the defined value.
Experiments show that with the good initial settings on a defined frequency, the design can be well optimised in the required vicinity of that frequency.

Optimised for 2.3-2.5 GHz:

![S11_Comparison](/data/images/S11_CST_Re_Im_2.3-2.5_optimisation.png) {:height="50%" width="50%"}

Optimised for 2.375-2.525 GHz (Wi-Fi channels range):

![S11_Comparison](/data/images/wi-fi_2.4GHz_channel_overlay.jpg)

![S11_Comparison](/data/images/S11_CST_Re_Im_2.3-2.5_optimisation.png){:height="50%" width="50%"}