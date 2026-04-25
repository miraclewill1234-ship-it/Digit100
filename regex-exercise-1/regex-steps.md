# # Regex Exercise 2 – Sonnets Autotagging Steps



---



**Find:**

```
\A([\s\S]*)\z
```

**Replace:**

```
<xml>\n\1\n</xml>
```


**Find:**

```
(?m)^Sonnet\s+([IVXLCDM]+)
```

**Replace:**

```
<sonnet number="\1">
```





**Find:**

```
(?m)^(?!<sonnet|</sonnet|<xml|</xml)(.+)$
```

**Replace:**

```
<line>\1</line>
```



## Step 4: Close each sonnet element

**Find:**

```
(?m)^$\n(?=<sonnet|</xml>)
```

**Replace:**

```
</sonnet>\n
```

**Purpose:**
Inserts a closing `</sonnet>` tag at the end of each poem before the next sonnet begins.

---



**Find:**

```
<line>\s*</line>
```

**Replace:**

```
```




**Find:**

```
\n{3,}
```

**Replace:**

```
\n\n
```



