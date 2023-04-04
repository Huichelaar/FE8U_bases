# FE8U_bases
Allows people to enter a previously completed chapter from the world map with a different set of events.

TODO write README!

TODO once you've got a working template for ch2, apply to other chapters.

Issue: Sometimes FreeRoaming unit staggers when moving. Not sure what causes it. Seems to happen when changing directions sometimes. Stopping movement and starting seems to be a way to fix it when it happens.

Issue: Switching which unit is controlled won't preserve which direction the previous unit faced. Switching controlled unit has been disabled. Facing direction could be stored in two bits in a unit's RAM UnitStruct. I'll leave that as an exercise to the reader.

Explain how adding idle gfx for controllable units works.

Mention you changed FreeMU to:
  - Initialize active unit as controlled unit. This means having to set SET_ACTIVE somewhere in the BeginningScene.
  - Always have FreeMovement active on base chapters, regardless of the FreeMovement flag's value. This was done to enable free movement when loading from suspend, despite not saving the FreeMovement flag, which would require EMS, which would further complicate applying this patch to an existing buildfile/project.
  - Require a flag in MokhaFreeMU/cFreeMU/FreeMovement.event to be set to allow changing which unit is controlled.

Mention that TrapRework is here as well now as it came with FreeMU.

Don't forget to mention the .gitignored FE8ChapterData.dmp file!

Don't forget to credit Mokha, Sme (FMU) and CardCaph (EirikaIdles).