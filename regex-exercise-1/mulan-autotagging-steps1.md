# # Mulan Screenplay – Regex Autotagging Steps



## Step 1: Prepare Your Files

1. Download the Mulan screenplay text file.
2. Save it in your project folder.
3. Make a copy of the file.
4. Rename the copy:



---

## Step 2: Add Root Element

Open `mulan-autotagged.txt`.

At the very top of the file, add:

<?xml version="1.0" encoding="UTF-8"?>
<screenplay>

At the very bottom of the file, add:

</screenplay>

This makes sure your final document is well-formed XML.

---

## Step 3: Wrap Chunks in `<sp>` Elements

We will use Regex Find & Replace.

Turn on:
- Regular Expression mode

---

## Step 4: Regex Find & Replace

FIND:

(.+?)(\r?\n\r?\n)

REPLACE WITH:

<sp>\1</sp>\2

---

## What This Does

- (.+?) captures one chunk of text.
- (\r?\n\r?\n) captures the blank line.
- <sp>\1</sp> wraps that chunk in a speech tag.
- \2 keeps the blank line spacing.

Click Replace All.

---

## Step 5: Fix the Final Chunk

If the last section of the screenplay does not end with a blank line, it may not get wrapped.

If needed, manually wrap the final section in:

<sp>
...
</sp>

---

## Step 6: Save as XML


