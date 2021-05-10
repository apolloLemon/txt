# txt.sh
### cmd notepad

this is essentially tool to quickly jot down text into a file with a dated filename that looks like this: YYYYMMDDhhmm_label.ext

simply use `./txt.sh` or the `txt` alias for daily.txt: yyyymmdd.txt

---

### setup
1. clone into homefolder OR get `txt.sh` into `~/txt/`
2. in txt.sh: `line 2: TXTT=default_text_tool`

---

### options
- h: hours in filename
- m: hours and minutes in filename
- l: label in filename
- L: only label in filename
- e: alternative extention
- a: append via echo >> file and no default texttool
- M: append minutedate and open default texttool
- t: choose texttool (subl, touch, vi, ... )

---

### examples
| txt options | effect |
|----|---|
|`txt` | opens yyyyddmm.txt with default texttool |
|`txt -M` | opens yyyyddmm.txt with default texttool and appends timestamp  |
|`txt -a "new line"`| `echo "new line" >> yyymmdd.txt;TXTT=""` : appends line to daily.txt without opening texttool |
|`txt -ht TXTtool -e EXT` | `TXTTool yyyddmmhh.EXT` : opens hourly file with custom extention with an alternative text tool |
|`txt -t py -l notes -e py` | `py yyyymmdd_notes.py` : exec of todays python notes  |
|`./txt.sh -L "script" -e "sh" -a "if $BOOL; then DO(); fi;" -t cat`| `echo "if $BOOL; then DO(); fi;" >> script.sh` : appends line to scipt.sh displays result using `cat`|
| `./txt.sh -L ".txt_aliases" -e "sh" -a "alias newalias=\"./txt.sh -L .txt_aliases -e sh -a\""` | makes the `newalias` alias which allows to add aliases to the .txt_aliases.sh file by using `newalias "myalias=\"txt -options\""`|
