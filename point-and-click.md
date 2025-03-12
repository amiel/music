## Lilypond Point and Click 

I finally got point-and-click triggering a script on mac :/

1. Install zathura (and the mupdf plugin)
2. Follow [these instructions](https://gist.github.com/georgebrock/9ab3d83bf160b7c1c2b0) to register a handler to call a script
3. ???? (TODO: now write the script to use nvim-remote)
4. Profit!!!

## applescript

part 2 involves using the script editor to create an Applescript "application". The script looks something like this:

```applescript
on open location theURL
    -- theURL is the raw string: e.g. "textedit://path/to/file.ly:12:3"
    do shell script "/Users/amiel/.local/bin/textedit-url-handler.sh " & quoted form of theURL
end open location
```

save as an application and add the following to its Info.plist:

```xml
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleURLName</key>
			<string>TextEditURL</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>textedit</string>
			</array>
		</dict>
	</array>

```
