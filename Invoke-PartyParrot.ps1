<#
.SYNOPSIS
This cmdlet brings the party to PowerShell with PartyParrot! Press 'q' to quit.

.DESCRIPTION
The cmdlet renders numerous frames of ASCII art in various colors to create a moving image.

Press 'q' to quit

.EXAMPLE
./Invoke-PartyParrot.ps1
#>

# Gotta have something to render, so here are the individual frames
# It's an array containing multiline strings
$parrotFrames = @(@"
                       .cccc;;cc;';c.
                      .,:dkdc:;;:c:,:d:.
                     .loc'.,cc::::::,..,:.
                   .cl;....;dkdccc::,...c;
                  .c:,';:'..ckc',;::;....;c.
                .c:'.,dkkoc:ok:;llllc,,c,';:.
               .;c,';okkkkkkkk:,lllll,:kd;.;:,.
               co..:kkkkkkkkkk:;llllc':kkc..oNc
             .cl;.,okkkkkkkkkkc,:cll;,okkc'.cO;
             ;k:..ckkkkkkkkkkkl..,;,.;xkko:',l'
            .,...';dkkkkkkkkkkd;.....ckkkl'.cO;
         .,,:,.;oo:ckkkkkkkkkkkdoc;;cdkkkc..cd,
      .cclo;,ccdkkl;llccdkkkkkkkkkkkkkkkd,.c;
     .lol:;;okkkkkxooc::loodkkkkkkkkkkkko'.oc
   .c:'..lkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkd,.oc
  .lo;,ccdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkd,.c;
,dx:..;lllllllllllllllllllllllllllllllloc'...
cNO;........................................
"@,@"
                .ckx;'........':c.
             .,:c:c:::oxxocoo::::,',.
            .odc'..:lkkoolllllo;..;d,
            ;c..:o:..;:..',;'.......;.
           ,c..:0Xx::o:.,cllc:,'::,.,c.
           ;c;lkXXXXXXl.;lllll;lXXOo;':c.
         ,dc.oXXXXXXXXl.,lllll;lXXXXx,c0:
         ;Oc.oXXXXXXXXo.':ll:;'oXXXXO;,l'
         'l;;OXXXXXXXXd'.'::'..dXXXXO;,l'
         'l;:0XXXXXXXX0x:...,:o0XXXXk,:x,
         'l;;kXXXXXXKXXXkol;oXXXXXXXO;oNc
        ,c'..ckk0XXXXXXXXXX00XXXXXXX0:;o:.
      .':;..:dd::ooooOXXXXXXXXXXXXXXXo..c;
    .',',:co0XX0kkkxx0XXXXXXXXXXXXXXX0c..;l.
  .:;'..oXXXXXXXXXXXXXXXXXXXXXXXXXXXXXko;';:.
.cdc..:oOXXXXXXXXKXXXXXXXXXXXXXXXXXXXXXXo..oc
:0o...:dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxo,.:,
cNo........................................;'
"@,@"
            .cc;.  ...  .;c.
         .,,cc:cc:lxxxl:ccc:;,.
        .lo;...lKKklllookl..cO;
      .cl;.,;'.okl;...'.;,..';:.
     .:o;;dkx,.ll..,cc::,..,'.;:,.
     co..lKKKkokl.':lllo;''ol..;dl.
   .,c;.,xKKKKKKo.':llll;.'oOxo,.cl,.
   cNo..lKKKKKKKo'';llll;;okKKKl..oNc
   cNo..lKKKKKKKko;':c:,'lKKKKKo'.oNc
   cNo..lKKKKKKKKKl.....'dKKKKKxc,l0:
   .c:'.lKKKKKKKKKk;....oKKKKKKo'.oNc
     ,:.,oxOKKKKKKKOxxxxOKKKKKKxc,;ol:.
     ;c..'':oookKKKKKKKKKKKKKKKKKk:.'clc.
   ,dl'.,oxo;'';oxOKKKKKKKKKKKKKKKOxxl::;,,.
  .dOc..lKKKkoooookKKKKKKKKKKKKKKKKKKKxl,;ol.
  cx,';okKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKl..;lc.
  co..:dddddddddddddddddddddddddddddddddl:;''::.
  co..........................................."
"@,@"
           .ccccccc.
      .,,,;cooolccol;;,,.
     .dOx;..;lllll;..;xOd.
   .cdo,',loOXXXXXkll;';odc.
  ,oo:;c,':oko:cccccc,...ckl.
  ;c.;kXo..::..;c::'.......oc
,dc..oXX0kk0o.':lll;..cxxc.,ld,
kNo.'oXXXXXXo'':lll;..oXXOd;cOd.
KOc;oOXXXXXXo.':lol,..dXXXXl';xc
Ol,:k0XXXXXX0c.,clc'.:0XXXXx,.oc
KOc;dOXXXXXXXl..';'..lXXXXXd..oc
dNo..oXXXXXXXOx:..'lxOXXXXXk,.:; ..
cNo..lXXXXXXXXXOolkXXXXXXXXXkl;..;:.;.
.,;'.,dkkkkk0XXXXXXXXXXXXXXXXXOxxl;,;,;l:.
  ;c.;:''''':doOXXXXXXXXXXXXXXXXXXOdo;';clc.
  ;c.lOdood:'''oXXXXXXXXXXXXXXXXXXXXXk,..;ol.
  ';.:xxxxxocccoxxxxxxxxxxxxxxxxxxxxxxl::'.';;.
  ';........................................;l'
"@,@"

        .;:;;,.,;;::,.
     .;':;........'co:.
   .clc;'':cllllc::,.':c.
  .lo;;o:coxdlooollc;',::,,.
.c:'.,cl,.'lc',,;;'......cO;
do;';oxoc::l;;llllc'.';;'.';.
c..ckkkkkkkd,;llllc'.:kkd;.':c.
'.,okkkkkkkkc;llllc,.:kkkdl,cO;
..;xkkkkkkkkc,ccll:,;okkkkk:,cl,
..,dkkkkkkkkc..,;,'ckkkkkkkc;ll.
..'okkkkkkkko,....'okkkkkkkc,:c.
c..ckkkkkkkkkdl;,:okkkkkkkkd,.',';.
d..':lxkkkkkkkkxxkkkkkkkkkkkdoc;,;'..'.,.
o...'';llllldkkkkkkkkkkkkkkkkkkdll;..'cdo.
o..,l;'''''';dkkkkkkkkkkkkkkkkkkkkdlc,..;lc.
o..;lc;;;;;;,,;clllllllllllllllllllllc'..,:c.
o..........................................;'
"@,@"

           .,,,,,,,,,.
         .ckKxodooxOOdcc.
      .cclooc'....';;cool.
     .loc;;;;clllllc;;;;;:;,.
   .c:'.,okd;;cdo:::::cl,..oc
  .:o;';okkx;';;,';::;'....,;,.
  co..ckkkkkddk:,cclll;.,c:,:o:.
  co..ckkkkkkkk:,cllll;.:kkd,.':c.
.,:;.,okkkkkkkk:,cclll;.:kkkdl;;o:.
cNo..ckkkkkkkkko,.;llc,.ckkkkkc..oc
,dd;.:kkkkkkkkkx;..;:,.'lkkkkko,.:,
  ;c.ckkkkkkkkkkc.....;ldkkkkkk:.,'
,dc..'okkkkkkkkkxoc;;cxkkkkkkkkc..,;,.
kNo..':lllllldkkkkkkkkkkkkkkkkkdcc,.;l.
KOc,l;''''''';lldkkkkkkkkkkkkkkkkkc..;lc.
xx:':;;;;,.,,...,;;cllllllllllllllc;'.;oo,
cNo.....................................oc
"@,@"

           .,,,,,,,,,.
         .ckKxodooxOOdcc.
      .cclooc'....';;cool.
     .loc;;;;clllllc;;;;;:;,.
   .c:'.,okd;;cdo:::::cl,..oc
  .:o;';okkx;';;,';::;'....,;,.
  co..ckkkkkddk:,cclll;.,c:,:o:.
  co..ckkkkkkkk:,cllll;.:kkd,.':c.
.,:;.,okkkkkkkk:,cclll;.:kkkdl;;o:.
cNo..ckkkkkkkkko,.;llc,.ckkkkkc..oc
,dd;.:kkkkkkkkkx;..;:,.'lkkkkko,.:,
  ;c.ckkkkkkkkkkc.....;ldkkkkkk:.,'
,dc..'okkkkkkkkkxoc;;cxkkkkkkkkc..,;,.
kNo..':lllllldkkkkkkkkkkkkkkkkkdcc,.;l.
KOc,l;''''''';lldkkkkkkkkkkkkkkkkkc..;lc.
xx:':;;;;,.,,...,;;cllllllllllllllc;'.;oo,
cNo.....................................oc
"@,@"


                   .ccccccc.
               .ccckNKOOOOkdcc.
            .;;cc:ccccccc:,::::,,.
         .c;:;.,cccllxOOOxlllc,;ol.
        .lkc,coxo:;oOOxooooooo;..:,
      .cdc.,dOOOc..cOd,.',,;'....':c.
      cNx'.lOOOOxlldOl..;lll;.....cO;
     ,do;,:dOOOOOOOOOl'':lll;..:d:.'c,
     co..lOOOOOOOOOOOl'':lll;.'lOd,.cd.
     co.,dOOOOOOOOOOOo,.;llc,.,dOOc..dc
     co..lOOOOOOOOOOOOc.';:,..cOOOl..oc
   .,:;.'::lxOOOOOOOOOo:'...,:oOOOc..dc
   ;Oc..cl'':llxOOOOOOOOdcclxOOOOx,.cd.
  .:;';lxl''''':lldOOOOOOOOOOOOOOc..oc
,dl,.'cooc:::,....,::coooooooooooc'.c:
cNo.................................oc
"@,@"



                        .cccccccc.
                  .,,,;;cc:cccccc:;;,.
                .cdxo;..,::cccc::,..;l.
               ,oo:,,:c:cdxxdllll:;,';:,.
             .cl;.,oxxc'.,cc,.',;;'...oNc
             ;Oc..cxxxc'.,c;..;lll;...cO;
           .;;',:ldxxxdoldxc..;lll:'...'c,
           ;c..cxxxxkxxkxxxc'.;lll:'','.cdc.
         .c;.;odxxxxxxxxxxxd;.,cll;.,l:.'dNc
        .:,''ccoxkxxkxxxxxxx:..,:;'.:xc..oNc
      .lc,.'lc':dxxxkxxxxxxxdl,...',lx:..dNc
     .:,',coxoc;;ccccoxxxxxxxxo:::oxxo,.cdc.
  .;':;.'oxxxxxc''''';cccoxxxxxxxxxkxc..oc
,do:'..,:llllll:;;;;;;,..,;:lllllllll;..oc
cNo.....................................oc
"@,@"


                              .ccccc.
                         .cc;'coooxkl;.
                     .:c:::c:,;,,,;c;;,.'.
                   .clc,',:,..:xxocc;...c;
                  .c:,';:ox:..:c,,,,,,...cd,
                .c:'.,oxxxxl::l:.;loll;..;ol.
                ;Oc..:xxxxxxxxx:.,llll,....oc
             .,;,',:loxxxxxxxxx:.,llll;.,;.'ld,
            .lo;..:xxxxxxxxxxxx:.'cllc,.:l:'cO;
           .:;...'cxxxxxxxxxxxxol;,::,..cdl;;l'
         .cl;':;'';oxxxxxxxxxxxxx:....,cooc,cO;
     .,,,::;,lxoc:,,:lxxxxxxxxxxxo:,,;lxxl;'oNc
   .cdxo;':lxxxxxxc'';cccccoxxxxxxxxxxxxo,.;lc.
  .loc'.'lxxxxxxxxocc;''''';ccoxxxxxxxxx:..oc
occ'..',:cccccccccccc:;;;;;;;;:ccccccccc,.'c,
Ol;......................................;l'
"@,@"

                              ,ddoodd,
                         .cc' ,ooccoo,'cc.
                      .ccldo;....,,...;oxdc.
                   .,,:cc;.''..;lol;;,'..lkl.
                  .dkc';:ccl;..;dl,.''.....oc
                .,lc',cdddddlccld;.,;c::'..,cc:.
                cNo..:ddddddddddd;':clll;,c,';xc
               .lo;,clddddddddddd;':clll;:kc..;'
             .,:;..:ddddddddddddd:';clll;;ll,..
             ;Oc..';:ldddddddddddl,.,c:;';dd;..
           .''',:lc,'cdddddddddddo:,'...'cdd;..
         .cdc';lddd:';lddddddddddddd;.';lddl,..
      .,;::;,cdddddol;;lllllodddddddlcodddd:.'l,
     .dOc..,lddddddddlccc;'';cclddddddddddd;,ll.
   .coc,;::ldddddddddddddl:ccc:ldddddddddlc,ck;
,dl::,..,cccccccccccccccccccccccccccccccc:;':xx,
cNd.........................................;lOc
"@)

# Need a variable to keep track of which frame we're using
$parrotIndex = 0

# Need a list of the bright colors from the PS console to render
# It's an array of strings
$colors = @(
"Blue",
"Green",
"Cyan",
"Red",
"Magenta",
"Yellow",
"White"
)


# We want the party to keep going in a loop
while ($true) {

    # Generate a random item from the color array
    $colorIndex = Get-Random -Maximum $colors.Count

    # Render the frame with the proper color
    Write-Host -ForegroundColor $colors[$colorIndex] $parrotFrames[$parrotIndex]

    # Hold the render in place until time to clear and move on to the new frame
    Start-Sleep -Milliseconds 75
    Clear-Host

    # Increment the index of the frame array. If at the end of the array, begin again
    if ($parrotIndex -lt ($parrotFrames.Count - 1)) {
        $parrotIndex++
    }
    else {
        $parrotIndex = 0
    }

    # Stop the party when 'q' is pressed to go back to work
    if ($Host.UI.RawUI.KeyAvailable -and ("q" -eq $Host.UI.RawUI.ReadKey("IncludeKeyUp,NoEcho").Character)) {
      Clear-Host
      break
    }
}