# The Wi-Fi Gun Project

This project is devoted to the modeling and constructing the narrow beam antenna for the Wi-Fi frequency range. 
The project was inspired by the Kreosan youtube video:

https://www.youtube.com/watch?v=s-MKhffuPzM&vl=en

However it is not the origin of the design.
The realy constructed antenna is the same as published in the video. This antenna was measured on professional equipment. 
The number of corresponding simulations were performed and results were compared.

## Antenna assembling
The real design copy the one from the source video as proved to be well working one.

![Antenna_photo](/data/images/original_scheme.jpg)

The antenna assembly.

![Antenna_photo](/data/photo/ph1.jpg)

The S11 of the antenna was measured on the Rohde & Schwarz VNA.

![S11_real_antenna](/data/images/WIFI_Gun_default__parameters_V2.png)

## Modeling in CST

For the convinient modeling and repeatability the design was combined into a macros with VBA language.
Macros construct the antenna design and also define optimisation goal (explained below).
All published cst models use the developped macros. Only the geomertic parameters vary for different models.  
To make macros available in CST put in into:
[CST folder]/Library/Macros/Construct/[create some folder]/

The macro is the main contribution of this work for the community. 


### The modelling of default parameters(from source video)

The S11 of the default antenna model
![S11_real_antenna](/data/images/S11_CST_Re_Im_default_parameters.png)


The farfield of the default antenna demonstrate good directivity
![S11_real_antenna](/data/images/farfield_default_parameters_2.4.png)


### Comparison of modeling and real antenna
The S11 of simulated model was compared with the real measurements. Results on the frequencies of interest are almost the same. 

![S11_Comparison](/data/images/Compare_CST_VNA.png)

### Optimisation
Macros also define optimisation goal - achieving the S11 not greater that the defined value.
Experiments show that with the good initial settings on a defined frequency, the design can be well optimised in the required vicinity of that frequency.

####Optimised for 2.3-2.5 GHz (in comparison with the default):

![S11_Comparison](/data/images/S11_CST_Re_Im_compare_default_optimised_2.3-2.5.png)

####Optimised for 2.375-2.525 GHz(in comparison with the default) 
In accordance with Wi-Fi channels ranges https://en.wikipedia.org/wiki/List_of_WLAN_channels (including some extra small margin):
As one can see this variant performs much better then the default on lower channels and S11 is almost flat in the full WI-Fi range.

![S11_Comparison](/data/images/wi-fi_2.4GHz_channel_overlay.png)

![S11_Comparison](/data/images/S11_CST_Re_Im_compare_default_optimised_2.375-2.525.png)

####Improved optimisation for 2.375-2.525 GHz(in comparison with the default) 
Some improvements in optimiser allowed to find better parameters. S11 characteristic is now smooth and without peaks within the Wi-Fi range.
The max S11<-18 dB! Directivity remains good.

![S11_Comparison](/data/images/S11_CST_Re_Im_compare_default_optimised_2.375-2.525_2.png)
