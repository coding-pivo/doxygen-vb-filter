@echo off
for /R input\vb6 %%f in (*.frm) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vb6\%%~nf.cs
)

for /R input\vb6 %%f in (*.cls) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vb6\%%~nf.cs
)

for /R input\vb6 %%f in (*.ctl) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vb6\%%~nf.cs
)

for /R input\vb6 %%f in (*.bas) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vb6\%%~nf.cs
)

for /R input\vba %%f in (*.frm) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vba\%%~nf.cs
)

for /R input\vba %%f in (*.cls) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vba\%%~nf.cs
)

for /R input\vba %%f in (*.bas) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vba\%%~nf.cs
)

for /R input\vbnet %%f in (*.vb) do  (
   gawk -f ..\vbfilter.awk "%%f" > output\vbnet\%%~nf.cs
)
