June-2020
raspbx-11-11-2019, Asterisk 16.6.1 & FreePBX 15.0.16.22
An 8GB card or larger is recommended.

---
This is Time-sensitive documentation
    Software changes
    OBi110 could be obsolete
    The FCC has said landlines where suppose to gone by 2020
---

Did NOT use FreePBX, only Asterisk!

This project is 
    • For my parent’s in their 90’s
    • Its on a inTRAnet
    • Mom does Not like voicemail!!!!
    • Disaster Recovery is important
        • I do Not live in town
        • Weekly backups are important, then flashing a micro SDcard afterwords

          Going to try going 8gb micro SDcard for faster flashing
          RPi 4B’s USB 3.0 are awesome for backups

        • Have replacement hardware: RPi, OBi110
        • Have a UPS for 4 outlets
        • Have the two phone cables marked with tape so they can be swapped
          easily by another person to eliminate the project

Either today’s telephone companies are bad or OBi110 has an issue of not
 always getting the Calling Number from the telephone company. Why
    1. OBITRUNK1 use to be  a default phone number in the Asterisk’s whitelist table
         ** must be alot of folks using the OBi setup **
    2. “End robocaller, solicitation, and hangup calls with Asterisk & Raspberry Pi” 
       by Bill Bishop posted 4apr2013 : Uses only entering a digit to get the phone to ring
    3. Hackaday.io's Alex has a 'Banana Phone Project'. ** His website has been discontinued **
          "Don't worry, it won't save blank caller IDs ...."

One of my sisters and I get hit by this numerous times a week calling Mom & Dad. 
Increasing the Obi’s “ring delay” to 6000 does NOT improve the probability of the issue from not happening.

Therefore I would change the algorithm to
    disapprove/blacklist

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
  ex. 867-5309 does not accept solicitations. If you are a solicitor, please hang up 
      now. Otherwise to connect, press 1.

Also, my parents have 5 phones in the house, so periodically a phone is not hung up 
properly. Have to program for dial status of busy.

Note: Do Not purchase any Asterisk books
      I bought 4 and wasted my money for what I'm doing here.
      They were all fine books but not focus on my project needs.
      Your best bet is youtube and googling

---
Contents of repository

README.txt
HowToInstall-raspbx.txt
    asterisk-initd.txt
    sip.conf
    extensions.conf
    voicemail.conf
        VoiceMail.txt
        blacklist.txt
        no-solicitors.gsm
PostInstall.txt

Assign.OBi110.IP.txt
OBi110setup.ods

Other Notes
    DisableFreePBX.txt
    ForceGettyOnHDMI.txt

    DialPlanNotes.txt
    PrintingDateInDialPlan-MSWindows.txt

    CustomSoundFiles.txt
    WavToGSM.txt
