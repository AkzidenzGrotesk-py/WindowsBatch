#! /usr/bin/python

import cgi
args = cgi.FieldStorage()

with open("serverdata.dat", "w") as data_file:
    data_file.write(args.getvalue("dat"))

print("Content-type: text/html\n\n")
print("""<!doctype html>
<html>
    <head>
        <title>Connect w/ batch</title>
        <meta charset="utf-8">
    </head>
    <body>
        <h1 style="text-align: center;">Use POST field <i>dat</i> to add data to the server file.</h1>
    </body>
</html>

""")
