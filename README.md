# FE8U_bases
 Allows people to enter a previously completed chapter from the world map with a different set of events.

TODO write this thing!

TODO once you've got a working template for ch2 apply to other chapters.

Mention you changed FreeMU to:
  - Initialize active unit as controlled unit. This means having to set SET_ACTIVE somewhere in the BeginningScene.
  - Always have FreeMovement active on base chapters, regardless of the FreeMovement flag's value. This was done to enable free movement when loading from suspend, despite not saving the FreeMovement flag, which would require EMS, which would further complicate applying this patch to an existing buildfile/project.
  - Require a flag in MokhaFreeMU/cFreeMU/FreeMovement.event to be set to allow changing which unit is controlled.

Mention that TrapRework is here too now.

Don't forget to mention the .gitignored FE8ChapterData.dmp file!