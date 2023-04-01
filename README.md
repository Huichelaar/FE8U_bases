# FE8U_bases
 Allows people to enter a previously completed chapter from the world map with a different set of events.

TODO write this thing!

TODO remove autosaving during base chapters.

TODO once you've got a working template for ch2 apply to other chapters.

Don't forget to mention the .gitignored FE8ChapterData.dmp file!

Mention why one shouldn't use memory slot 10 in base chapters. It stores the actual next chapter, which we had to overwrite to load the base chapter (RAM chapterData 0x202BCF0 + 0xE).