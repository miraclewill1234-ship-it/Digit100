# Regex Exercise 3- Autotagging *The Blithedale Romance
Step 1: Add a root element
Find:
^

Replace:
<novel>

Then add at the very end of the file:
</novel>


Step 2: Tag paragraphs
Find:
(.+)

Replace:
<paragraph>$1</paragraph>


Step 3: Tag character names with titles
Find:
(Mr\.|Mrs\.|Miss)\s[A-Z][a-z]+

Replace:
<character>$&</character>


Step 4: Tag main character names
Find:
\b(Zenobia|Coverdale|Hollingsworth|Priscilla)\b

Replace:
<character>$1</character>


Step 5: Tag places
Find:
\b(Blithedale|river|forest|farm)\b

Replace:
<place>$1</place>


Step 6: Tag dialogue
Find:
"([^"]+)"

Replace:
<dialogue>"$1"</dialogue>


