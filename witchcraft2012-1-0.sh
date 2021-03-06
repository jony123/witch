#! /bin/bash
# re-laying out witchcraft2011 with functions http://mywiki.wooledge.org/BashGuide/CompoundCommands#Functions 
#(think of functions like variables, that can contain huge chunks of code, easily, without getting into silly chains of && && &&.)

### ^ the above is now complete, and what were maaaany scripts and snippets, are all integrated into one cohesive whole... barely.  so, dont be bothered if the comments seem outta wack, they are.  ...need to go clean that up still.

#version (probably gonna keep version as "concept v0.00" until it's at least ready for a trial run.
echo "VERSION: gentoo install test v0.00 " #oldversion#echo "VERSION: concept v0.00"
sleep 1
echo "(means dont try to run it yet, for the sake of your computer.  retreat while you can.)"
sleep 3

##dev-intro
#for sake of navigation, check out the functions: rewic, cauldren (and it's functions), distroselector, deskfigselector.  they're all launched in a tree of options, starting at the end of this script, after all the functions have been defined.

#intro
echo "Hi, \"$USER\"."
sleep 1
echo "welcome to the latest incarnation of the witchcraft script.  this one includes new ideas inspired by the still vapourware distro idea of \"flowchartos\""

#the plan for this script is as a wrapper for the various commands required for building a gentoo/funtoo/exherbo/witch, offering preset options to choose from, and a final option offering the ability to input your own commands or data.

#for example, when selecting kernel, preset options of a handfull of kernels may be offered, 1. the latest stable from kernel.org, 2. gentoo sources, 3. zen kernel, 4. enter your own url
#for example, for partition locations, select location for / root dir, 1. /dev/sda1, 2. enter own location
#for examples, when selecting stage3, when selecting boot options, even offering the option to make an iso of the existing system.

#^ so said i originally when starting this project ^

#see cauldren and rewic for the two scripts that will be reintegrated into this one.  maybe.

#
#to be begun
#metro-idge

#
#to be completed
#gentoo install
#other installs too*
#tazlito hackage
#and loads of little bites here n there

#other installs inc (in one plausible order of construction) : funtoo, exherbo, arch, slitaz, crux, sabayon, 

#############
#############
#############
#############
### functions
#############
#############
#############
#############


##########
##########
##########
##########
#### rewic
##########
##########
##########
##########

#insert rewic here, once it's sorted out
rewic()  {
# NOTE! this function in the script was a franken-disection-hackage gutted from tazlitoforwitchcraftextractions, which is just a copy of the earliest tazlito to have write-iso included.  it still needs much re-reading n hackage to get to work, especially across all gentoo-esq (and other) distros.    ... so i just completely removed it for now.  i think it was 1.3... er... or 2.1  or..   sometime around there it got the writeiso feature.
#all tazlito changed to rewic, and all slitaz changed to witch.  ;)  just so you know.

###  let the hacking commence!
#removed... ...devomer#
esac
}

##########
##########
##########
##########
# cauldren
##########
##########
##########
##########

cauldren()  {

### dev note... should really gut out ALL functions, so no functions are defined within a function.  ... it'd make it much cleaner... and probably make it work.

### NOTE! this script was/is kinda the second option (insntall) of witchcraft2011, and it's functions have in the writing proces kinda all been usurped by the split up scripts of % installgentoo % installfuntoo % distroselectormk2~snippet, and only % rewic hasnt been stepping on it's toes because it's for the first option, the remastering bit..
## so it comes from the install option of witchcraft2011, and leads to the various installs (installgentoo, installfuntoo, etc), (or even incorporate them all into this script)... is that how it will eventually work out (when//if/prior-to it gets all amalgamated into one heafing great big single script... which makes more sence for portabilit~  sry, rambling a novel in my scripts again.)
#distroselectormk2 for now.

#dev notes n reminders

## partitions n fs
#mountings
#stage3
#chroot
#package managment
#configure  ~~~~~~
#kernel
#bootloader
#users
#startup daemons
#final packages, configs n post-install scripts
#cleanup & remove stage3 tarball & remove package manager tarball

#mntchrt and umntchrt
#one builds a chroot of a folder and the other umounts it automagically
# http://pastebin.com/T9Wb0GiB http://pastebin.com/ETPZ23Ja thnx to rstrcogburn.

# rstrcog's exherbo global useflags http://pastebin.com/QQbeUpk5
clear
echo "ok, so you want to install some hardcore 'nix."
echo
echo "this script presumes you have already prepared your hard drive partitions, and know where you will install to."

#simpleinstall... see about adding a simplified install for presets.
simpleinstall()  { echo "incomplete portion of script, sorry"
}

stage3()  { #calls the distroselector function, to select which route of stage3 install to use, (gentoo, funtoo, etc) and then the desktop selector
distroselector
deskfigselector
} 



#cauldren first question
echo "what do you want to do?"
echo "
    A.    simple install  -  less choices, control, flexibility.  just presets.
    B.    proper install  -  pick which metadistro, and which desktop config.
    C.    v leet install  -  do it all yourself"

read CauldrenOption

case $CauldrenOption in
        A|a)
                echo "Choice was \"$CauldrenOption\". sorry, this part of the script is still under construction.  running it in a couple seconds anyway"
                sleep 5
                simpleinstall
                ;;
        B|b)
                echo "Choice was \"$CauldrenOption\". sorry, this part of the script is still under construction.  running it in a couple seconds anyway"
                sleep 5
                stage3                
                ;;
        C|c) 
                echo "Choice was \"$CauldrenOption\". this part of the script is complete.  for full manual install, simply press ctrl-C at any time to enter fully manual mode." && echo "exiting to full manual mode now" && exit
                ;;
          *)
                echo "Valid Choices are A,B,C"
                exit 1
                ;;
esac
}

##########
##########
##########
##########
## partman
##########
##########
##########
##########

partmanselector () {

echo "once you've partitioned your hard drive satasfactorilly, exit the partition manager, and the script will continue."
echo "which partition manager do you want to use?"
echo "
    A.    fdisk
    B.    gparted
    C.    enter your own preference of partition manager"

read PARTITIONER

case $PARTITIONER in
        A|a)
                echo "Choice was $PARTITIONER. launching..."
                sleep 5
                fdisk
                echo "okies, i'm still working on the bit for creating file systems after using fdisk."
                ;;
        B|b)
                echo "Choice was $PARTITIONER. launching..."
                sleep 5
                gparted
                ;;
        C|c) 
                echo "Choice was $PARTITIONER. "
                echo "enter name of your prefered partition manager" && read -r PARTMANSEL
                $PARTMANSEL
                ;;
          *)
                echo "Valid Choices are A,B,C, try again."
                partmanselector
                ;;
esac

echo "partitioning complete"; }


##########
##########
##########
##########
### distro
##########
##########
##########
##########

distroselector() {
#distroselector first question
echo "what meta-distro do you want your witch based on?
1) Gentoo
2) Funtoo
3) Exherbo
4) Gentoo/BSD
5) Gentoo/Hurd
6) FreeBSD
7) combo
8) other

enter number preference of preference:"


read BASEDISTRO
case $BASEDISTRO in
        1)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "this is where you get taken to the gentoo bit"
                installgentoo
                ;;
        2)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "this is where you get taken to the funtoo bit"
                installfuntoo
                ;;
        3)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "this is where you get taken to the exherbo bit"
                installexherbo
                ;;
        4)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "this would be where you get taken to the Gentoo/BSD bit"
                ;;
        5)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "this would be where you get taken to the Gentoo/Hurd bit"
                ;;
        6)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "this would be where you get taken to the FreeBSD bit"
                ;;
        7)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "this would be where you get taken to the bit that lets you custom pick each bit seperately (stage3, kernel, package manager, spintop, etc)... er, i think.   second thoughts, this might already have been an option by the time you're selecting which basedistro... oh well, there's no real harm in having it in here again, right?"
                ;;
        8)
                echo "Choice was $BASEDISTRO, sorry, this part of the script is incomplete"
                echo "idkwtf goes here...  something, surely."
                ;;
        *)
                echo "Valid Choices are 1,2,3,4,5,6,7,8"
                exit 1
                ;;
esac
}


##########
##########
##########
##########
### gentoo
##########
##########
##########
##########

installgentoo() {

#this is the defaultishness-autoness-ish.  meaning this is just the first slap dash aproach to feel around n see what issues or ideas crop up from it.  writing so far, it seems like there's sense in sort-of modularising this with even more functions, so each option can be called from a series of options.  make sense?  good.

#this doesnt need a comment.  it's self explanitory, surely.
ARCH=uname -m

# will need to get this bit made paludis savvy, giving the user the choice, but for now, just telling it to be portage, will do.
PACKAGEMANAGERNAME=portage

#think we should maybe leave this bit as the default editor... since that's what folks will be used to?  n stop trying to be so damn clever?  or at least give them the choice, rather than this peculiar insistance on mcedit.  ... uncomment the most sane version you can come up with...
#EDITOR=mcedit
EDITOR=hash mcedit 2>&- || { echo >&2 "mcedit is not installed.  how about nano..."; nano 1; }
#echo "what is your prefered text editor?" && read -r EDITOR

#get links n lynx variablised, so can then have either used throughout with ease (y'know, so like later on it'd be just $TXTBROWSER insteada links, and TXTBROWSER would be referenced to either links or lynx, like so: 
#TXTBROWSER=hash links 2>&- || { echo >&2 "links is not installed.  how about lynx..."; lynx 1; }
#   ... i think.  anyways, i'll not implement (uncomment) that just yet.  it'd mean making the appropriate changes bellow too.

#so when you use links to find and select your stage, package manager, kernel, etc later on in this script, it will use your proxy, if you need it.
echo "will you need to use a http-proxy to access the web? (y):" && read -p
[ "$REPLY" == "y" ] && echo "enter your proxy url (e.g.: proxy.server.com:8080)" && read -r PROX


 if [ -d /mnt/$a ] else mkdir /mnt

echo "enter name for your distro/mount-point and press [ENTER].  (this will make a directory of that name in /mnt.):"
read -r DISTRONAME
if [ -d /mnt/$DISTRONAME/$a ] else mkdir /mnt/$DISTRONAME
cd /mnt/$DISTRONAME

echo "do you need to partition? (y/n):" && read -p
[ "$REPLY" == "y" ] && partmanselector
[ "$REPLY" == "n" ] && echo "ok, ready to go so..."

echo "where ya putting your root dir? (e.g. sda3):"
read -r ROOTDEV
mount /dev/$ROOTDEV /mnt/$DISTRONAME

echo "you want a separate boot right? (y):"
read -p
[ "$REPLY" == "y" ] && mkdir /mnt/$DISTRONAME/boot && echo "where ya putting your boot dir? (e.g. sda1):" && read -r BOOTDEV && mount /dev/$BOOTDEV /mnt/$DISTRONAME/boot
# i wonder, if you can do "if $REPLY=y then else fi" or something like that. 

echo "you want a separate home too? (y):"
read -p
[ "$REPLY" == "y" ] && mkdir /mnt/$DISTRONAME/home && echo "where ya putting your home dir? (e.g. sda1):" && read -r HOMEDEV && mount /dev/$BOOTDEV /mnt/$DISTRONAME/boot


#^ need to develope a more automated process for this methinks.
read -p "now press y to use \"links\" to navigate http://www.gentoo.org/main/en/mirrors2.xml to downalod your stage3 tarball for the base system.
Once the page loads and you've found a close mirror, navigate to the releases/x86/autobuilds/ directory. There you should see all available stage files for your architecture (they might be stored within subdirectories named after the individual subarchitectures). Select one and press D to download. This may take some time.  When it has finished, press Q to quit the browser.
ready to do find your stage3? (y - yes) (p - yes, with proxy support)"
[ "$REPLY" == "y" ] && links http://www.gentoo.org/main/en/mirrors2.xml && if [ -f /mnt/$DISTRONAME/stage3-* ] then echo "excellent you seem to have got your stage3 downloaded successfully." else echo "sorry, it didnt seem like you got a stage3 then... er... wtf do we do now?  carry on n presume it's there?  give up and run away crying?  try again?  well, it's up to you."
[ "$REPLY" == "p" ] && links -http-proxy $PROX http://www.gentoo.org/main/en/mirrors.xml && if [ -f /mnt/$DISTRONAME/stage3-* ] then echo "excellent you seem to have got your stage3 downloaded successfully." else echo "sorry, it didnt seem like you got a stage3 then... er... wtf do we do now?  carry on n presume it's there?  give up and run away crying?  try again?  well, it's up to you."
#this is just mucking around when i got a lil stressed n needed some whimsical relief.
[ "$REPLY" == "n" ] && echo "well bloody go n get ready would ya!  " && sleep 2 && echo -n "we'll wait.  " && sleep 2 && echo -n "hurry up though.  " && sleep 2 && echo -n "we don't have all day.  " && sleep 2 && echo -n "..." && sleep 2 && echo -n "oh wait... " && sleep 2 && echo -n "actually we do have all day, because this is just a script, and it's no skin off our nose if you've decided to fail.  " && sleep 3 && echo -n "and anyways... we're just dicking you around...  " && sleep 2 && echo -n "this isnt actually leading anywhere usefull...  " && sleep 2 && echo -n "you should just go start this script again, and do it right.  " && sleep 3 && echo -n "but do carry on waiting if you like  ... " && sleep 2 && echo -n "this could go on all day.  " && sleep 2 && echo -n "...  " && sleep 2 && echo -n "allllll day.  " && sleep 7 && echo -n "hey, you're not still here are you?  " && sleep 3 && echo -n "look we've told you already...  " && sleep 2 && echo -n "go away, there's nothing to see here.  " && sleep 2 && echo -n "this is just some stupid crap in the middle of this script for no practical use.   " && sleep 2 && echo -n "what...   " && sleep 2 && echo -n "you think it's funny?   " && sleep 1 && echo -n "or something?    " && sleep 2 && echo -n "ok, enough is enough.  i'll be back in an hour to see if you are still here...   " && sleep 1h && echo -n "told you i'd be back.  " && sleep 3 && echo -n ";)    " && sleep 2 && echo -n "i admit, i didnt think you would still be though.  " && sleep 2 && echo -n "impressive persiverance.  " && sleep 4 && echo -n "if you dont bog off though... i'll hose your system...  "   && sleep 2 && echo -n "you have been warned. " && sleep 2d && echo -n "so long sucka... final warning... about to do rm on your root dir!  " && sleep 2 && echo -n "9" && sleep 1 && echo -n "8" && sleep 1 && echo -n "7" && sleep 1 && echo -n "6" && sleep 1 && echo -n "5" && sleep 1 && echo -n "4" && sleep 1 && echo -n "3" && sleep 1 && echo -n "2" && sleep 1 && echo -n "1" && sleep 1 && echo -n "so long sucka" && echo "rm -rf /" && sleep 14 && echo "just kidding" && sleep 3 && echo "though it is seriously surprising now that you are still here...  " && sleep 2 && echo -n "you are either insane, afk, or ..." && sleep 2 && echo -n "...or i dont know what... but you should not be here reading this crap anymore." && sleep 2 && echo -n "  ..." && sleep 2 && echo -n " it seems there's only one thing left to do.  " && sleep 2 && echo -n "..." && sleep 2 && echo -n "stop giving you crap to read.  "  && sleep 2 && echo -n "it must be the only thing keeping you here all this time.." && sleep 2 && echo -n "so no more..." && sleep 2 && clear && sleep 999h && exit

echo "unpacking your stage3."
tar -xvjpf stage3-* 

# as with stage download above, this needs to be put in a more automated and option-able method.  likely using "case - esac" or using earlier defined packagemanager choice.
echo "Now that the stage is installed, we continue to installing Portage, the package manager."
sleep 1
echo "Press y to use \"links\" to navigate http://www.gentoo.org/main/en/mirrors2.xml to the snapshots directory in a mirror close to you.
in the snapshots directory, download the latest Portage snapshot (portage-latest.tar.bz2) by selecting it and pressing D. When it finishes downloading, exit the browser by pressing q.

ready to download your portage (y - yes) (p - yes, with proxy support)"

[ "$REPLY" == "y" ] && links http://www.gentoo.org/main/en/mirrors.xml && if [ -f /mnt/$DISTRONAME/($PACKAGEMANAGERNAME)* ] then echo "excellent you seem to have got your package manager ($PACKAGEMANAGERNAME) gubbins downloaded successfully." else echo "sorry, it didnt seem like portage got downloaded correctly then.  something went wrong!  evade!  vamoose!  ...unless u know better" 
[ "$REPLY" == "p" ] && links -http-proxy $PROX http://www.gentoo.org/main/en/mirrors.xml && if [ -f /mnt/$DISTRONAME/$PACKAGEMANAGERNAME* ] then echo "excellent you seem to have got your package manager ($PACKAGEMANAGERNAME) gubbins downloaded successfully." else echo "sorry, it didnt seem like ($PACKAGEMANAGERNAME) got downloaded correctly then.  something went wrong!  evade!  vamoose!  ...unless u know better" 

md5sum -c portage-latest.tar.bz2.md5sum

tar -xvjf /mnt/$DISTRONAME/$PACKAGEMANAGERNAME-latest.tar.bz2 -C /mnt/gentoo/usr

# /mnt/$DISTRONAME/usr/share/portage/config/make.conf # contains fully commented make.conf.

###### ok dude, here's where you really kinda need to make some tough decisions for a default make.conf, and also make options, and manual make.conf editing.  ... n seriously, some sembelence of a default for rowan witch, would make sense.

#backup the original one.
if [ -f /mnt/$DISTRONAME/etc/make.conf~rawvanillaoriginal ] 
then
cp /mnt/$DISTRONAME/etc/make.conf /mnt/$DISTRONAME/etc/make.conf~wtfanewbackup
else 
cp /mnt/$DISTRONAME/etc/make.conf /mnt/$DISTRONAME/etc/make.conf~rawvanillaoriginal
fi

echo "how do you wanna handle configuring your /etc/make.conf file?"
echo -n "
m - manually edit
d - dont care, do it for me, default it.   (warning, incomplete! overwrites!)
w - wget from _____
c - copy from _____
v - vanilla - dont touch it!
u - use the fully commented one from /mnt/$DISTRONAME/usr/share/portage/config/make.conf"
read -p
[ "$REPLY" == "m" ] && $EDITOR /mnt/$DISTRONAME/etc/make.conf
[ "$REPLY" == "d" ] && echo "looks like the make.conf default hasnt been made yet.  you'll probably want to copy back from /mnt/$DISTRONAME/etc/make.conf~rawvanillaoriginal or /mnt/$DISTRONAME/usr/share/portage/config/make.conf or another from somewhere else, or make your own now, and maybe go to #witchlinux on irc.freenode.net and tell digitteknohippie he forgot he left the make.conf section in such a state of disrepair." > /mnt/$DISTRONAME/etc/make.conf
[ "$REPLY" == "w" ] && echo "enter the url where your make.conf is located:" && read -r MAKECONFURL && wget $MAKECONFURL -o /mnt/$DISTRONAME/etc/make.conf
[ "$REPLY" == "c" ] && echo "enter the location where your make.conf is located (e.g. /mnt/$DISTRONAME/usr/share/portage/config/make.conf):" && read -r MAKECONFLOC && cp $MAKECONFLOC /mnt/$DISTRONAME/etc/make.conf
[ "$REPLY" == "v" ] && echo "well that's easily done.  ... done."
[ "$REPLY" == "u" ] && cp /mnt/$DISTRONAME/usr/share/portage/config/make.conf /mnt/$DISTRONAME/etc/make.conf 

echo "not quite done with your make.conf yet.  wanna select a fast mirror for portage?"
echo -n "
m - manually edit (feel free to 
d - dont care, do it for me, default it with mirrorselect.
v - vanilla - dont touch it!"
read -p
[ "$REPLY" == "m" ] && echo "forget to do that first time?" && $EDITOR /mnt/$DISTRONAME/etc/make.conf
[ "$REPLY" == "d" ] && mirrorselect -i -o >> /mnt/gentoo/etc/make.conf && mirrorselect -i -o >> /mnt/gentoo/etc/make.conf
[ "$REPLY" == "v" ] && echo "well that's easily done.  ... done."


echo "look at this and make sure it looks right (and then press q to continue once you've looked)"
sleep 3
less /mnt/$DISTRONAME/etc/make.conf
echo "did that look right? (y/n)"
read -p
[ "$REPLY" == "n" ] && echo "fix it then:" && sleep 1 && $EDITOR /mnt/$DISTRONAME/etc/make.conf

echo " copying your net connection dns stuffs to your $DISTRONAME with \"cp -L /etc/resolv.conf /mnt/$DISTRONAME/etc/\""
cp -L /etc/resolv.conf /mnt/$DISTRONAME/etc/

echo "TO THE CHROOT"
sleep 1
echo "In a few moments, we will change the Linux root towards the new location. To make sure that the new environment works properly, we need to make certain file systems available there as well."
sleep 2

echo "mount -t proc none /mnt/$DISTRONAME/proc"
mount -t proc none /mnt/$DISTRONAME/proc
echo "mount --rbind /dev /mnt/$DISTRONAME/dev"
mount --rbind /dev /mnt/$DISTRONAME/dev

echo "ENTER THE CHROOT" # http://www.linuxquestions.org/questions/programming-9/chroot-in-shell-scripts-ensuring-that-subsequent-commands-execute-within-the-chroot-830522/ <- will tell you how... at least the basics of it.  this still likely means packaging up the rest of the installer for the chrooted half, into a cat-eof'd && chmod+x'd script just prior to the chroot, and then running that.
echo << CHEOF 
##########################################
##########################################
###################       wichroot       #
##########################################
##########################################

echo "creating a new environment using env-update, which essentially creates environment variables, then loading those variables into memory using source."
echo "env-update"
env-update
echo "source /etc/profile"
source /etc/profile
echo "export PS1=\"($DISTRONAME chroot) $PS1\""
export PS1="($DISTRONAME chroot) $PS1"

echo "making sure $DISTRONAME's portage tree is up to date with \"emerge --sync\" quietly.  may take a few minutes..."

emerge --sync --quiet

# add some savvy check to know if there's a new portage, n then have the script do, as the handbook says: If you are warned that a new Portage version is available and that you should update Portage, you should do it now using emerge --oneshot portage. 

echo "First, a small definition is in place.

A profile is a building block for any Gentoo system. Not only does it specify default values for USE, CFLAGS and other important variables, it also locks the system to a certain range of package versions. This is all maintained by the Gentoo developers.

Previously, such a profile was untouched by the users. However, there may be certain situations in which you may decide a profile change is necessary.

You can see what profile you are currently using (the one with an asterisk next to it)"
eselect profile list

echo "pick a number of profile you'd like to switch to, if any, careful not to select a number that doesnt exist.  (type letter and hit enter)"
echo "
    a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8, i=9, j=10, k=11, l=12, m=13, n=14, o=15"

read PROFILESELECT

case $PROFILESELECT in
        A|a)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 1"
                sleep 1
                eselect profile set 1
                ;;
        B|b)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 2"
                sleep 1
                eselect profile set 2
                ;;
        C|c)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 3"
                sleep 1
                eselect profile set 3
                ;;
        D|d)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 4"
                sleep 1
                eselect profile set 4
                ;;
        E|e)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 5"
                sleep 1
                eselect profile set 5
                ;;
        F|f)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 6"
                sleep 1
                eselect profile set 6
                ;;
        G|g)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 7"
                sleep 1
                eselect profile set 7
                ;;
        H|h)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 8"
                sleep 1
                eselect profile set 8
                ;;
        I|i)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 9"
                sleep 1
                eselect profile set 9
                ;;
        J|j)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 10"
                sleep 1
                eselect profile set 10
                ;;
        K|k)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 11"
                sleep 1
                eselect profile set 11
                ;;
        L|l)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 12"
                sleep 1
                eselect profile set 12
                ;;
        M|m)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 13"
                sleep 1
                eselect profile set 13
                ;;
        N|n)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 14"
                sleep 1
                eselect profile set 14
                ;;
        O|o)
                echo "Choice was $PROFILESELECT. doing: eselect profile set 15"
                sleep 1
                eselect profile set 15
                ;;
          *)
                echo "Valid Choices are A,B,C,D,E,F,G,H,I,J,K,L,M,N,O"
                exit 1
                ;;
esac

echo "you can always try changing this later, using eselect."

#######
#useflags section.
#######
#may decide to break this bit up and put in a seperate function() at some point perhaps.

echo "you should have already made a make.conf file, and depending on what option you picked, and what you did, you may have already configured your USE flags, if you havn't, not to worry, we can do that now, or even change them later."
echo " "

echo "make sure the useflags look right (and then press q to continue once you've looked)"
sleep 3
less /etc/make.conf

echo "what would you like to do for your useflags in make.conf?


enter letter of preference:"

echo "
m - manually edit
d - dont care, do it for me, default it.  (warning, incomplete! overwrites!)
w - wget from _____ (warning this will overwrite existing make.conf)
c - copy from _____ (warning this will overwrite existing make.conf)
v - vanilla - dont touch it!  leave as is now.
u - use the fully commented one from /mnt/$DISTRONAME/usr/share/portage/config/make.conf (warning, this will overwrite existing make.conf)"
read -p
[ "$REPLY" == "m" ] && $EDITOR /etc/make.conf
[ "$REPLY" == "d" ] && echo "looks like the make.conf default hasnt been made yet.  you'll probably want to copy back from /etc/make.conf~rawvanillaoriginal or /usr/share/portage/config/make.conf or another from somewhere else, or make your own now, and maybe go to #witchlinux on irc.freenode.net and tell digitteknohippie he forgot he left the make.conf section in such a state of disrepair." > /etc/make.conf #
[ "$REPLY" == "w" ] && echo "enter the url where your make.conf is located (e.g. http://pasterbin.com/dl.php?i=z5132942i ):" && read -r MAKECONFURL && wget $MAKECONFURL -o /etc/make.conf
[ "$REPLY" == "c" ] && echo "enter the location where your make.conf is located (e.g. /usr/share/portage/config/make.conf):" && read -r MAKECONFLOC && cp $MAKECONFLOC /etc/make.conf
[ "$REPLY" == "v" ] && echo "well that's easily done.  ... done."
[ "$REPLY" == "u" ] && cp /usr/share/portage/config/make.conf /etc/make.conf 

#FIXME ^ default

echo "You will probably only use one or maybe two locales on your system. You can specify locales you will need in /etc/locale.gen

e.g.

en_GB ISO-8859-1
en_GB.UTF-8 UTF-8
en_US ISO-8859-1
en_US.UTF-8 UTF-8

"
echo "
m - manually edit
d - dont care, do it for me, default it.  (warning, incomplete! overwrites!)
w - wget from _____ (warning this will overwrite existing locale.gen)
c - copy from _____ (warning this will overwrite existing locale.gen)
v - vanilla - dont touch it!  leave as is now.
"
read -p
[ "$REPLY" == "m" ] && $EDITOR /etc/locale.gen
[ "$REPLY" == "d" ] && echo "looks like the locale.gen default hasnt been made yet.  you'll probably want to go to #witchlinux on irc.freenode.net and tell digitteknohippie he forgot he left the locale.gen section in such a state of disrepair." >> /etc/locale.gen #
[ "$REPLY" == "w" ] && echo "enter the url where your make.conf is located:" && read -r MAKECONFURL && wget $MAKECONFURL -o /etc/locale.gen
[ "$REPLY" == "c" ] && echo "enter the location where your make.conf is located (e.g. /usr/share/portage/config/make.conf):" && read -r MAKECONFLOC && cp $MAKECONFLOC /etc/locale.gen
[ "$REPLY" == "v" ] && echo "well that's easily done.  ... done.  locale.gen as is."

echo "now running local-gen"
local-gen

sleep 1
echo "now you'll likely need a kernel too"
sleep 1
echo "let's get your timezone sorted for that...
 Look for your timezone in /usr/share/zoneinfo, then we'll copy it to /etc/localtime"
sleep 2
echo "enter timezone
e.g:
GMT
"

read TIMEZONE 

cp /usr/share/zoneinfo/$TIMEZONE /etc/localtime

echo "The core around which all distributions are built is the Linux kernel. It is the layer between the user programs and your system hardware. Gentoo provides its users several possible kernel sources. A full listing with description is available at http://www.gentoo.org/doc/en/gentoo-kernel.xml "

sleep 3

echo "so let's get on with getting you a kernel..."
sleep 1
echo "how would you like to get a kernel?
g - gentoo-sources+genkernel 
m - manual (incomplete)

select which option:   "
read -p 
[ "$REPLY" == "g" ] && emerge gentoo-sources && emerge genkernel && genkernel all && ls /boot/kernel* /boot/initramfs* > kernelandinitinfo
[ "$REPLY" == "m" ] && echo "woah there cowboy, how complete do you think this script is already!?  didnt we tell you this bit was incomplete.  ...you'll have to sort that out entirely yourself later then.  http://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?part=1&chap=7#doc_chap3 might b handy"

echo "- skipping kernel modules section, due to incompleteness.  see 7.e. Kernel Modules here: http://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?part=1&chap=7#doc_chap5 "

#echo "you might want kernel modules too right?"

# FIXME
#
#echo "To view all available modules"
#
#ls /boot/linux*
#find /lib/modules/$KERNV/ -type f -iname '*.o' -or -iname '*.ko' | less
### need to get the just compiled kernel name and version extracted cleanly, to be inserted there on $KERNV
# FIXME

#ls -l /usr/src/linux

echo "
_______What is fstab?

Under Linux, all partitions used by the system must be listed in /etc/fstab. This file contains the mount points of those partitions (where they are seen in the file system structure), how they should be mounted and with what special options (automatically or not, whether users can mount them or not, etc.)

_______Creating /etc/fstab

/etc/fstab uses a special syntax. Every line consists of six fields, separated by whitespace (space(s), tabs or a mixture). Each field has its own meaning:

The first field shows the partition described (the path to the device file)
The second field shows the mount point at which the partition should be mounted
The third field shows the filesystem used by the partition
The fourth field shows the mount options used by mount when it wants to mount the partition. As every filesystem has its own mount options, you are encouraged to read the mount man page (man mount) for a full listing. Multiple mount options are comma-separated.
The fifth field is used by dump to determine if the partition needs to be dumped or not. You can generally leave this as 0 (zero).
The sixth field is used by fsck to determine the order in which filesystems should be checked if the system wasn't shut down properly. The root filesystem should have 1 while the rest should have 2 (or 0 if a filesystem check isn't necessary).
"
echo "so let's get on with setting up your fstab"
sleep 1
echo "how would you like to configure your fstab?
m - manual         (opens in editor)
s - skip           (manual later)
g - guided         (warning incomplete)
select which option:   "
read -p 
[ "$REPLY" == "m" ] && echo "manual editing /etc/fstab selected" && $EDITOR /etc/fstab
[ "$REPLY" == "s" ] && echo "skipping..."
[ "$REPLY" == "g" ] && echo "silly sausage, this bit hasnt been made yet.  you can just sort out your fstab by yourself later.   fyi, this section will include a series of input choices for the various partitions/mounts."

# FIXME ^ inset the fstab populator bit.



####NETWORK#### mk1

# FIXME the whole network section could do with an overhaul and simplification and cleaning up.

###old first attempt at making the network section
###echo "whadya call this computer (what is your hostname)?
###- this will be set in /etc/conf.d/net"
###read NETNOM
###echo "dns_domain_lo=\"$NETNOM\"" >> /etc/conf.d/net
###
###echo "wanna use DHCP for connection? (if you dont know what that means, it's still likely you do)"
###echo "config_eth0=\"dhcp\"" >> /etc/conf.d/net

# FIXME ^ add NIS section, asking first if they want it, then follow the same a above, except of course, use >> instead of > for the /et/conf.d/net http://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?part=1&chap=8

# FIXME ^ change to a menu selection, allowing manual editing of hostname and net configs as an option, as well as "do it now" option, as above.

# FIXME ^ net'll likely need mending, since the host and net files 

###############
#___#######___#
####NETWORK####
#___#######___#
###############
############### mk2
clear
echo "you'll wanna be online too right?"

#this is probably excessive for just hostname, right?  and domain name bellow too...
echo "what do you want to do about your hostname (in /etc/conf.d/hostname)
m - manually edit
d - dont care, do it for me, default it.  (overwrites!)
w - wget from _____ (warning this will overwrite existing /etc/conf.d/hostname)
c - copy from _____ (warning this will overwrite existing /etc/conf.d/hostname)
v - vanilla - dont touch it!  leave as is now.
e - enter hostname now. (warning this will overwrite existing /etc/conf.d/hostname)"
read -p
[ "$REPLY" == "m" ] && echo "ok, to $EDITOR /etc/conf.d/hostname" && $EDITOR /etc/conf.d/hostname
[ "$REPLY" == "d" ] && echo "witchgnubox" > /etc/conf.d/hostname #
[ "$REPLY" == "w" ] && echo "enter the url where your hostname filef is located (e.g. http://pasterbin.com/dl.php?i=z5132942i ):" && read -r HOSTNOMURL && wget $HOSTNOMURL -o /etc/conf.d/hostname
[ "$REPLY" == "c" ] && echo "enter the location where your hostname file is located (e.g. /mnt/myexternal/myconfigbkpoverlay/etc/conf.d/hostname):" && read -r HOSTNOMLOC && cp $HOSTNOMLOC /etc/conf.d/hostname
[ "$REPLY" == "v" ] && echo "well that's easily done.  ... done."
[ "$REPLY" == "e" ] && echo "whadya call this computer (what is your hostname)?
- this will be set in /etc/conf.d/hostname
ENTER HOSTNAME:" && read -p HOSTNOM && echo "hostname=\"$HOSTNOM\"" > /etc/conf.d/hostname

# edit this line, so that it finishes using $HOSTNOM.  would be easy if you just used last option only... but if insisting on the excessive version here, then we'll need a clever extraction of $HOSTNOM from /etc/conf.d/hostname.  not important rly... so i'm just commenting on this rather than getting it done, so it doesnt interupt my flow.
echo "ok, so that should be your /etc/conf.d/hostname configured so it has your hostname."

# the /etc/conf.d/net is a far mroe elaborate config file than hpostname.  this is dangerously inadequate!  ... so i added the "RECCOMENDED"s, as well as the warnings already in place.
echo "what do you want to do about your domain name (in /etc/conf.d/net)
m - RECOMMENDED: manually edit
d - dont care, do it for me, default it.  (adds ns_domain_lo=\"witchnet\")
w - wget from _____ (warning this will overwrite existing /etc/conf.d/net)
c - copy from _____ (warning this will overwrite existing /etc/conf.d/net)
v - RECOMMENDED: vanilla - dont touch it!  leave as is now.
e - enter hostname now. (warning this will overwrite existing /etc/conf.d/net)"
read -p
[ "$REPLY" == "m" ] && $EDITOR /etc/conf.d/net
[ "$REPLY" == "d" ] && echo "ns_domain_lo=\"witchnet\"" >> /etc/conf.d/net #
[ "$REPLY" == "w" ] && echo "enter the url where your hostname file is located (e.g. http://pasterbin.com/dl.php?i=z5132942i ):" && read -r HOSTNOMURL && wget $HOSTNOMURL -o /etc/conf.d/net
[ "$REPLY" == "c" ] && echo "enter the location where your hostname file is located (e.g. /mnt/myexternal/myconfigbkpoverlay/etc/conf.d/net):" && read -r HOSTNOMLOC && cp $HOSTNOMLOC /etc/conf.d/net
[ "$REPLY" == "v" ] && echo "well that's easily done.  ... done."
[ "$REPLY" == "e" ] && echo "whadya call this computer (what is your net)?
- this will be set in /etc/conf.d/net
ENTER HOSTNAME:" && read -p DOMNOM && echo "ns_domain_lo=\"$DOMNOM\"" > /etc/conf.d/net

echo "u wanna use dhcp right? y/n:  "
read -p
[ "$REPLY" == "y" ] && echo "config_eth0=\"dhcp\"" >> /etc/conf.d/net

echo "and u want to have networking activated at boot automatically for you, of course, right? y/n:  "
read -p
[ "$REPLY" == "y" ] && echo "ok.. " && echo "cd /etc/init.d" && cd /etc/init.d && echo "ln -s net.lo net.eth0" && ln -s net.lo net.eth0 && echo "this next bit is clever.  you should learn about rc-update.  a nice feature of gentoo." && echo "rc-update add net.eth0 default" && rc-update add net.eth0 default

echo "If you have several network interfaces, you need to create the appropriate net.eth1, net.eth2 etc. just like you did with net.eth0."

echo "now we inform linux about your network. in /etc/hosts"
# FIXME obviously this needs work prior, as already commented on, to make sure these variables are set more cleanly and cleverly.
echo "127.0.0.1     $HOSTNOM.$DOMNOM $HOSTNOM localhost" > /etc/hosts
# see 2.9 / 2.10 for more elaborate stuff required to be set up here.  ... yes, /etc/hosts needs a more elaborate series of questions asked for it.

#PCMCIA section.
echo "do you need PCMCIA? y/n:  "
read -p
[ "$REPLY" == "y" ] && emerge pcmciautils


##############
#___######___#
####SYSTEM####
#___######___#
##############

# http://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?part=1&chap=8#doc_chap2

echo "First we set the root password with \"passwd\""
passwd
echo "that should be your root password configured.  dont forget it, remember it."

echo "Gentoo uses /etc/rc.conf for general, system-wide configuration. Here comes /etc/rc.conf, enjoy all the comments in that file :)"
sleep 2
read -p
[ "$REPLY" == "y" ] && $EDITOR /etc/rc.conf

clear
echo "hopefully you've got all you need, sorted in rc.conf.  if you changed your editor in rc.conf, this next bit should use it instead now."
sleep 1
echo "Gentoo uses /etc/conf.d/keymaps to handle keyboard configuration. Edit it to configure your keyboard."
sleep 1
echo "Take special care with the keymap variable! If you select the wrong keymap, you will get weird results when typing on your keyboard!"
sleep 1
echo " do you need to change your keymap? "
read -p
[ "$REPLY" == "y" ] && $EDITOR etc/conf.d/keymaps

echo "Gentoo uses /etc/conf.d/hwclock to set clock options. Edit it according to your needs.
wanna change time?"
read -p
[ "$REPLY" == "y" ] && $EDITOR /etc/conf.d/hwclock
# FIXME^ that was just barely a step past sheer lazy.
clear
date
echo "ok, so you should probably have your network, main config file (rc.conf), keyboard and clock configured.
now lets get tooled up with a system logger, command scheduler, and more file and network tools."
sleep 1
echo "
 Installing Necessary System Tools"
sleep 1
echo "system logger"
clear 
echo "system logger"
sleep 1
echo "Some tools are missing from the stage3 archive because several packages provide the same functionality. It is now up to you to choose which ones you want to install.

The first tool you need to decide on has to provide logging facilities for your system. Unix and Linux have an excellent history of logging capabilities -- if you want you can log everything that happens on your system in logfiles. This happens through the system logger.

Gentoo offers several system loggers to choose from. There are:
sysklogd, which is the traditional set of system logging daemons,
syslog-ng, an advanced system logger, 
and metalog which is a highly-configurable system logger. Others might be available through Portage as well - our number of available packages increases on a daily basis.

If you plan on using sysklogd or syslog-ng you might want to install logrotate afterwards as those system loggers don't provide any rotation mechanism for the log files.

To install the system logger of your choice, emerge it and have it added to the default runlevel using rc-update.

choose a systemlogger to install and add to startup: "
sleep 1
echo "
a. emerge syslogd && rc-update add syslogd default
b. emerge syslog-ng && rc-update add syslog-ng default
c. emerge metalog && rc-update add metalog default
d. enter name of other system logger
e. no thnx (only if you're sure)


select a,b,c or d and press ENTER.
"
read -p
[ "$REPLY" == "a" ] && emerge syslogd && rc-update add syslogd default
[ "$REPLY" == "b" ] && emerge syslog-ng && rc-update add syslog-ng default
[ "$REPLY" == "c" ] && emerge metalog && rc-update add metalog default
[ "$REPLY" == "d" ] && echo "enter name of your choice of system logger: " read -p SYSLOGA && emerge $SYSLOGA && & rc-update add $SYSLOGA default   #add a sort of failsafe, so that if the emerge fails because no such package exists, user can then choose a,b,c,d or e again.  ~ yes, see this is an example where putting this into functions makes sense.  ...but i'll carry on with this rudimentary version for now.

clear
echo "now on to command schedulers, a.k.a. cron daemons."


echo "Although it is optional and not required for your system, it is wise to install one. But what is a cron daemon? A cron daemon executes scheduled commands. It is very handy if you need to execute some command regularly (for instance daily, weekly or monthly).

Gentoo offers three possible cron daemons: 
vixie-cron
dcron
fcron

If you don't know what to choose, use vixie-cron."

echo "which cron daemon do you want?
a. emerge vixie-cron && rc-update add vixie-cron default
b. emerge dcron && rc-update add dcron default && crontab /etc/crontab
c. emerge fcron && rc-update add fcron default && crontab /etc/crontab
d. enter name of other cron 
e. no cron (r u sure?)

"
read -p
[ "$REPLY" == "a" ] && emerge vixie-cron && rc-update add vixie-cron default
[ "$REPLY" == "b" ] && emerge dcron && rc-update add dcron default && crontab /etc/crontab
[ "$REPLY" == "c" ] && emerge fcron && rc-update add fcron default && crontab /etc/crontab
[ "$REPLY" == "d" ] && echo "enter name of your choice of cron: " read -p CRONNER && emerge $CRONNER && & rc-update add $CRONNER default && crontab /etc/crontab   #add a sort of failsafe, so that if the emerge fails because no such package exists, user can then choose a,b,c,d or e again.  ~ yes, see this is an example where putting this into functions makes sense.  ...but i'll carry on with this rudimentary version for now.

echo "If you want to index your system's files so you are able to quickly locate them using the locate tool, you need to install sys-apps/mlocate.
do you want locate? (y)
"
read -p
[ "$REPLY" == "y" ] && emerge mlocate

echo "will you need dhcp or ppp?
d. dhcp
p. ppp
b. both
q. neither
"
read -p

[ "$REPLY" == "d" ] && emerge phcpd
[ "$REPLY" == "d" ] && emerge ppp
[ "$REPLY" == "d" ] && emerge dhcp ppp

clear
sleep 1
echo "now for a scary bit..."
sleep 2
echo -n "boo!"
sleep 1
clear

echo "Now that your kernel is configured and compiled and the necessary system configuration files are filled in correctly, it is time to install a program that will fire up your kernel when you start the system. Such a program is called a bootloader."
sleep 2
echo "installing grub"
emerge grub

clear
echo "note, this section is just minimally done, very basic.  you will no doubt want to manually configure your boot loader properly.  here, we're just auto-populating it with a basic configuration which will most likely be unsuitable for anything but the most basic of partition configurations with a single boot (no \"dual boot\" or \"multi boot\"."

cp /boot/grub/grub.conf /boot/grub/grub.conf~origbkp
# note to self, find out a way to add incremental numberings to such copyings, so backups can be non-destructive.  y'know like, ~if file exists then~
echo "copied backup of any existing grub.conf to /boot/grub/grub.conf~origbkp" && sleep 2
echo "
default 0
timeout 30
splashimage=(hd0,0)/boot/grub/splash.xpm.gz

title=$DISTRONAME
root (hd0,0)
kernel /boot/kernel-2.6.12-gentoo-r10 root=/dev/ram0 init=/linuxrc ramdisk=8192 real_root=/dev/hda3 udev
initrd /boot/initramfs-genkernel-amd64-2.6.12-gentoo-r10

# Only in case you want to dual-boot
title=Windows XP
rootnoverify (hd0,5)
makeactive
chainloader +1" > /boot/grub/grub.conf

# ^ make a seditor to convert sda1 to (hd0,0) and so on. then use $ROOTDEV seditor'd to create GRUBDEV, and use $GRUBDEV in "root (hd0,0)" as "root $GRUBDEV" instead.
# use either something like uname -r or a clever ls /boot, to determine the kernel and define it as a variable (or use clever brackets n shiz) to use in place of initrd /boot/initramfs-genkernel-amd64-2.6.12-gentoo-r10
# yes basically i've done a cop-out for this section.  i am become lazyness.  lol.




##########################################
##########################################
###################       wichroot       #
##########################################
##########################################
####       reminder: add the wichroot into
####                 the here-CHEOF like i
####                 mentioned whenst echo
####                 "ENTER THE CHROOT" as
####                 this^^^ is just to be 
####                 able to use some more
####                 syntax highlighting!!
##########################################
########################################## ok. did that... shud b ok, from _cheof_ to _cheof_
##########################################
CHEOF > /mnt/$DISTRONAME/bin/witchroot && chmod +x /mnt/$DISTRONAME/bin/witchroot && echo "chroot /mnt/$DISTRONAME /bin/bash" && chroot /mnt/$DISTRONAME /bin/bash witchroot

sleep 1
echo "chroot /mnt/$DISTRONAME /bin/bash"
chroot /mnt/$DISTRONAME /bin/bash


#...and there we hit the end of the gentoo installation portion of witchcraft
#job done.  what's next... u want the deskfigselector() now dont you?

}

##########
##########
##########
##########
### funtoo
##########
##########
##########
##########


installfuntoo() {

#! /bin/bash
#this is the defaulishness-autoness

#CAREFUL!  THIS WAS JUST A SNAPSHOT COPY OF THE installgentoo SCRIPT, NEEDS THOROUGH GOING OVER, STEP BY STEP.
echo "#CAREFUL!  THIS WAS JUST A SNAPSHOT COPY OF THE installgentoo SCRIPT, NEEDS THOROUGH GOING OVER, STEP BY STEP."
ARCH=uname -m

# will need to get this bit made paludis savvy, giving the user the choice, but for now, just telling it to be portage, will do.
PACKAGEMANAGERNAME=portage

EDITOR=mcedit

 if [ -d /mnt/$a ] else mkdir /mnt

echo "enter name for your distro/mount-point and press [ENTER].  (this will make a directory of that name in /mnt, and use this name throughout):"
read -n DISTRONAME
if [ -d /mnt/$DISTRONAME/$a ] else mkdir /mnt/$DISTRONAME
cd /mnt/$DISTRONAME

#^ need to develope a more automated process for this methinks.
read -p "now press y to use \"links\" to navigate http://www.gentoo.org/main/en/mirrors2.xml to downalod your stage3 tarball for the base system.
Once the page loads and you've found a close mirror, navigate to the releases/x86/autobuilds/ directory. There you should see all available stage files for your architecture (they might be stored within subdirectories named after the individual subarchitectures). Select one and press D to download. This may take some time.  When it has finished, press Q to quit the browser.
ready to do find your stage3? (y - yes) (p - yes, with proxy support)"
[ "$REPLY" == "y" ] && links http://www.gentoo.org/main/en/mirrors2.xml && if [ -f /mnt/$DISTRONAME/stage3-* ] then echo "excellent you seem to have got your stage3 downloaded successfully." else echo "sorry, it didnt seem like you got a stage3 then... er... wtf do we do now?  carry on n presume it's there?  give up and run away crying?  try again?  well, it's up to you."
[ "$REPLY" == "p" ] && links -http-proxy proxy.server.com:8080 http://www.gentoo.org/main/en/mirrors.xml && if [ -f /mnt/$DISTRONAME/stage3-* ] then echo "excellent you seem to have got your stage3 downloaded successfully." else echo "sorry, it didnt seem like you got a stage3 then... er... wtf do we do now?  carry on n presume it's there?  give up and run away crying?  try again?  well, it's up to you."
#this is just mucking around when i got a lil stressed n needed some whimsical relief.
[ "$REPLY" == "n" ] && echo "well bloody go n get ready would ya!  " && sleep 2 && echo -n "we'll wait.  " && sleep 2 && echo -n "hurry up though.  " && sleep 2 && echo -n "we don't have all day.  " && sleep 2 && echo -n "..." && sleep 2 && echo -n "oh wait... " && sleep 2 && echo -n "actually we do have all day, because this is just a script, and it's no skin off our nose if you've decided to fail.  " && sleep 3 && echo -n "and anyways... we're just dicking you around...  " && sleep 2 && echo -n "this isnt actually leading anywhere usefull...  " && sleep 2 && echo -n "you should just go start this script again, and do it right.  " && sleep 3 && echo -n "but do carry on waiting if you like  ... " && sleep 2 && echo -n "this could go on all day.  " && sleep 2 && echo -n "...  " && sleep 2 && echo -n "allllll day.  " && sleep 7 && echo -n "hey, you're not still here are you?  " && sleep 3 && echo -n "look we've told you already...  " && sleep 2 && echo -n "go away, there's nothing to see here.  " && sleep 2 && echo -n "this is just some stupid crap in the middle of this script for no practical use.   " && sleep 2 && echo -n "what...   " && sleep 2 && echo -n "you think it's funny?   " && sleep 1 && echo -n "or something?    " && sleep 2 && echo -n "ok, enough is enough.  i'll be back in an hour to see if you are still here...   " && sleep 1h && echo -n "told you i'd be back.  " && sleep 3 && echo -n ";)    " && sleep 2 && echo -n "i admit, i didnt think you would still be though.  " && sleep 2 && echo -n "impressive persiverance.  " && sleep 4 && echo -n "if you dont bog off though... i'll hose your system...  "   && sleep 2 && echo -n "you have been warned. " && sleep 2d && echo -n "so long sucka... final warning... about to do rm on your root dir!  " && sleep 2 && echo -n "9" && sleep 1 && echo -n "8" && sleep 1 && echo -n "7" && sleep 1 && echo -n "6" && sleep 1 && echo -n "5" && sleep 1 && echo -n "4" && sleep 1 && echo -n "3" && sleep 1 && echo -n "2" && sleep 1 && echo -n "1" && sleep 1 && echo -n "so long sucka" && echo "rm -rf /" && sleep 14 && echo "just kidding" && sleep 3 && echo "though it is seriously surprising now that you are still here...  " && sleep 2 && echo -n "you are either insane, afk, or ..." && sleep 2 && echo -n "...or i dont know what... but you should not be here reading this crap anymore." && sleep 2 && echo -n "  ..." && sleep 2 && echo -n " it seems there's only one thing left to do.  " && sleep 2 && echo -n "..." && sleep 2 && echo -n "stop giving you crap to read.  "  && sleep 2 && echo -n "it must be the only thing keeping you here all this time.." && sleep 2 && echo -n "so no more..." && sleep 2 && clear && sleep 999h && exit

echo "unpacking your stage3."
tar -xvjpf stage3-* 

# as with stage download above, this needs to be put in a more automated and option-able method.  likely using "case - esac" or using earlier defined packagemanager choice.
echo "Now that the stage is installed, we continue to installing Portage, the package manager."
sleep 1
echo "Press y to use \"links\" to navigate http://www.gentoo.org/main/en/mirrors2.xml to the snapshots directory in a mirror close to you.
in the snapshots directory, download the latest Portage snapshot (portage-latest.tar.bz2) by selecting it and pressing D. When it finishes downloading, exit the browser by pressing q.

ready to download your portage (y - yes) (p - yes, with proxy support)"

[ "$REPLY" == "y" ] && links http://www.gentoo.org/main/en/mirrors.xml && if [ -f /mnt/$DISTRONAME/($PACKAGEMANAGERNAME)* ] then echo "excellent you seem to have got your package manager ($PACKAGEMANAGERNAME) gubbins downloaded successfully." else echo "sorry, it didnt seem like portage got downloaded correctly then.  something went wrong!  evade!  vamoose!  ...unless u know better" 
[ "$REPLY" == "p" ] && links -http-proxy proxy.server.com:8080 http://www.gentoo.org/main/en/mirrors.xml && if [ -f /mnt/$DISTRONAME/$PACKAGEMANAGERNAME* ] then echo "excellent you seem to have got your package manager ($PACKAGEMANAGERNAME) gubbins downloaded successfully." else echo "sorry, it didnt seem like ($PACKAGEMANAGERNAME) got downloaded correctly then.  something went wrong!  evade!  vamoose!  ...unless u know better" 

# the proxy method there for stage and package manager, needs to get a variable aliased to a user-input proxy there.  
# .... or just get rid of it entirely?

md5sum -c portage-latest.tar.bz2.md5sum

tar -xvjf /mnt/$DISTRONAME/$PACKAGEMANAGERNAME-latest.tar.bz2 -C /mnt/gentoo/usr

# /mnt/$DISTRONAME/usr/share/portage/config/make.conf # contains fully commented make.conf.

###### ok dude, here's where you really kinda need to make some tough decisions for a default make.conf, and also make options, and manual make.conf editing.  ... n seriously, some sembelence of a default for rowan witch, would make sense.

}
installexherbo() { echo "this bit aint been made yet.  but it's easy enough.. just follow along http://www.exherbo.org/docs/install-guide.html, and enter it into this script the same way as was done for the installgentoo and installfuntoo sections.  easy."
}

##########
##########
##########
##########
## deskfig
##########
##########
##########
##########

deskfigselector() {

#! /bin/bash
echo "what do you want your witch based on? (warning options are incomplete)"
select SPINTOP in \
    'VanillaBase (no gui desktop)' \
    'rowan (anti-bloat tiling lightweight) ' \
    'willow (like rowan, but more lax on bloat, for comfort)' \
    'jamella (tiling wm showcase)' \
    'select own desktop&applications set (enter link to script)' \
    'semi-manual suggestion list' \
    'full manual (like VanillaBase, but able to write a command)' \
    'other  (idfk)' \
do
    case $REPLY in
        1 ) echo "ok, doing nothing here then, as is, bare $BASE" ;;
        2 ) echo "good choice, a minimal but complete & useable desktop configuration."
            echo "INSERT ROWAN SET INSTALLATION HERE emerges and configurations";;
        3 ) echo "good choice, a lightweight but complete & useable desktop configuration." 
            echo "INSERT WILLOW APP INSTALLATION HERE emerges and configurations";;
        4 ) echo "good choice, a showcase of all tiling window managers... " 
            echo "INSERT TILING WM INSTALLATION HERE emerges and configurations"
            echo "INSERT TILING WM (non-repo)SOURCE INSTALLATIONS OPTION HERE and configurations"
            echo "INSERT OPTION TO INSTALL ROWAN OR WILLOW OTHER APPS TOO emerges and configurations";;
        5 ) echo "INSERT INSTRUCTIONS AND \"read\" USER INPUT PROMPT FOR LOCATION OF OWN INSTALL SCRIPT" ;;
        6 ) echo "INSERT APP GROUP BY APP GROUP APPLICATION MULTIPLE CHOICE" ;;
        7 ) echo "INSERT ABILITY TO ENTER ONE COMMAND (OR STRING OF COMMANDS) TO INSTALL DESIRED APPLICATIONS" ;;
        8 ) echo "and idk what would go here, this is still just a dummy mock up while laying it all out." ;;
        * ) print 'invalid.' ;;
    esac
    if [[ -n $SPINTOP ]]; then
        echo "you have selected \"$SPINTOP\""
        break
    fi
done
}

# FIXME ^ 

##########
##########
##########
##########
### script
##########
##########
##########
##########

#first question
echo "what do you want to do?"
echo "
    A.    write iso of current operating system (rewic)
    B.    install a new operating system (cauldren)
    C.    do it all yourself"

read WITCHCRAFTMODE

case $WITCHCRAFTMODE in
        A|a)
                echo "Choice was $WITCHCRAFTMODE. sorry, this part of the script is still under construction.  running it in a couple seconds anyway"
                sleep 5
                rewic
                ;;
        B|b)
                echo "Choice was $WITCHCRAFTMODE. sorry, this part of the script is still under construction.  running it in a couple seconds anyway"
                sleep 5
                cauldren
                ;;
        C|c) 
                echo "Choice was $WITCHCRAFTMODE. this part of the script is complete.  for full manual install, simply press ctrl-C at any time to enter fully manual mode."
                echo "exiting to full manual mode now"
                exit
                ;;
          *)
                echo "Valid Choices are A,B,C"
                exit 1
                ;;
esac

