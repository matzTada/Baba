# Baba!
Attempt to make one's hand card shaffling system in BabaArashi  
BabaArashi(baba嵐 in Japanese) is a card game which is almost same to the Japanese card game calld "Daifugo"(Refer [Wikipedia](https://en.wikipedia.org/wiki/Daifug%C5%8D) for rules)  

This system is super simple.  
BabaServer calculate who exchanges one's card to whom, when BabaClient send a packet after a button is pushed with it.  
That's all.  
Nothing more, nothing less.  

# BabaServer
Usual state  
Who exchanges whom is written  
You can see the clock, too. Nice!  
<a><img src="https://github.com/matzTada/Baba/blob/master/babaServer/image/server1.png" alt="" width=50%></a>  
After receving a packet...  
<a><img src="https://github.com/matzTada/Baba/blob/master/babaServer/image/server2.png" alt="" width=50%></a>  
After 5 seconds (or several seconds) return to usual state.

XBee must be connected to the computer which runs BabaServer program.

# BabaClient

## Schematic 1: XBee x Arduino Fio v3 x Li-Po battery x LEGO
Connect XBee, Arduino Fio v3, Li-Po battery, and button  
Then put it into the cabinet made with LEGO 
###Cabinet by LEGO
<a><img src="https://github.com/matzTada/Baba/blob/master/schematic/lego/babaClientLego.png" alt="" width=50%></a>  

Use LEGO DIGITAL DESIGNER  
<http://ldd.lego.com/>  
See <http://matztada.github.io/other/lego/Building%20Instructions%20[babaClientLego].html>

## Schematic 2: XBee x PowerCell

###PowerCell What is PowerCell?  
Check pin assignment to enable switching ON/OFF  
<https://www.sparkfun.com/tutorials/379>

### Wiring
<a><img src="https://github.com/matzTada/Baba/blob/master/schematic/frizzing/xbeeLiPo_breadboard.png" alt="" width=50%></a>  

### XBee setting
Some property must be changed to do IO detecting and communicating.  
Set Distination address. (Notice!! PAN ID must be same to the XBee Coodinator)  
<a><img src="https://github.com/matzTada/Baba/blob/master/xbeeSetting/xbeeSetting1.png" alt="" width=50%></a>  
Change IO pin settings as following to detect voltage variation with DIO4 pin.  
<a><img src="https://github.com/matzTada/Baba/blob/master/xbeeSetting/xbeeSetting2.png" alt="" width=50%></a>  
