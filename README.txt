June-2020
raspbx-11-11-2019, Asterisk 16.6.1 & FreePBX 15.0.16.22
An 8GB card or larger is recommended.

This project is 
    • For my parent’s in their 90’s
    • Its on a inTRAnet
    • Mom does Not like voicemail!!!!
    • Disaster Recovery is important
    • I do Not live in town
    • My Mom and I review her log of bad calls every weekend
    • I make changes to the block and approved lists
    • Weekly backups are important, then flashing a micro SDcard afterwords
          Going to try going 8gb micro SDcard
          RPi 4B’s USB 3.0 are awesome for backups
    • Have a backup hardware: RPi, OBi110
    • Have a UPS for 4 outlets

Either today’s telephone companies are bad or OBi110 has an issue of not
 always getting the Calling Number from the telephone company.
    1. OBITRUNK1 is a default phone number in the Asterisk’s white listed table
    2. “End robocaller, solicitation, and hangup calls with Asterisk & Raspberry Pi” 
       by Bill Bishop posted 4apr2013 : Use entering a digit to get the phone to ring

One of my sisters and I get hit by this numerous times a week calling Mom & Dad. 
Increasing the Obi’s “ring delay” to 6000 does Not improve the probability of the issue from not happening.

Therefore I would change the algorithm to
	disapprove/blacklist

	disapprove by ${CALLERID(name)}         ; This how I can stop political robo calls
            
Read(digit,custom/no-solicitors,1,s,1,4)      ; Read one digit in 4 seconds
GotoIf($["${digit}" != "1"]?NoResponse)
Playback(one-moment-please)
Dial(SIP/PHONE)
GotoIf($["${DIALSTATUS}" = "BUSY"]?biseee)
Hangup()
;
(NoResponse)
Hangup()
;
(biseee)
PlayBack(is-curntly-busy)   5 times
Hangup()

No negative reinforcement from siblings since every one is treated the same whether 
the Asterisk gets the calling phone number or not!


I would also personalize the no-solicitors sound file so infrequent callers are not 
put off.
  ex. 867-5309 does not accept solicitations. If you are a solicitors, please hang up 
      now. Otherwise to connect, press 1.

Also, my parents have 5 phones in the house, so periodically a phone is not hung up 
properly. Have to program for dial status of busy.




