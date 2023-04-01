# Convert raw chapter data hex into EA format
import re

# "Ooooh, I'm RE, and I'm so special I can't have more than 99 groups. Split your string and re-evaluate your life choices please!"
searchString1 = r"([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F])"
searchString2 = r"([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F]) ([0-9|A-F][0-9|A-F])"

replaceString1 = r"WORD 0x\4\3\2\1\nBYTE 0x\5 0x0 0x\6 0x\7 0x\8 0x\9 0x\10 0x\11 0x\12 //PLIST things.\nBYTE 0x\13\nBYTE 0x\14\nBYTE 0x\15\nBYTE 0x\16\nBYTE 0x\17 0x\18 //Initial coordinates.\nBYTE 0x\19\nBYTE 0x\20\nSHORT 0x\21\22\nSHORT 0x\24\23 0x\26\25 0x\28\27 0x\30\29 0x\32\31 0x\34\33 0x\36\35 0x\38\37\nSHORT 0x\40\39 0x\42\41 0x\44\43\nBYTE 0x\45\nBYTE 0x\46 0x\47 0x\48 0x\49 0x\50 0x\51 0x\52 0x\53 0x\54 0x\55 0x\56 0x\57 0x\58 0x\59 0x\60 0x\61 0x\62\nSHORT 0x\64\63 0x\66\65 0x\68\67 0x\70\69 0x\72\71 0x\74\73 0x\76\75 0x\78\77 0x\80\79 0x\82\81 0x\84\83 0x\86\85 0x\88\87 0x\90\89 0x\92\91 0x\94\93 0x\96\95\n"
replaceString2 = r"WORD 0x\4\3\2\1 0x\8\7\6\5 0x\12\11\10\9 0x\16\15\14\13\nSHORT 0x\18\17 0x\20\19\nBYTE 0x\21 //event PLIST\nBYTE 0x\22 //world map event.\nBYTE 0x\23 0x\24 0x\25 0x\26 0x\27 0x\28 0x\29 0x\30 0x\31 0x\32\nBYTE 0x\33 //chapter number.\nBYTE 0x\34 0x\35 0x\36 0x\37 0x\38\nBYTE 0x\39\nBYTE 0x\40\nSHORT 0x\42\41 0x\44\43\nBYTE 0x\45\nBYTE 0x\46\nBYTE 0x\47\nBYTE 0x\48 0x\49\nBYTE 0x\50 0x\51 0x\52"

f = open("ch0Raw.txt", "r")
string = f.read()
f.close()

string1 = string[0:3*96-1]
string2 = string[3*96:len(string)]

newString1 = re.sub(searchString1, replaceString1, string1)
newString2 = re.sub(searchString2, replaceString2, string2)
newString = newString1 + newString2
print(newString)