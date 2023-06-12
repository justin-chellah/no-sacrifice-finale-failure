#include <sourcemod>

#define REQUIRE_EXTENSIONS
#include <sourcescramble>

#define GAMEDATA_FILE	"no_sacrifice_finale_failure"

public void OnPluginStart()
{
	GameData hGameData = new GameData( GAMEDATA_FILE );

	if ( hGameData == null )
	{
		SetFailState( "Unable to load gamedata file \"" ... GAMEDATA_FILE ... "\"" );
	}

	MemoryPatch hMemoryPatcher = MemoryPatch.CreateFromConf( hGameData, "trigger_finale condition" );

	if ( !hMemoryPatcher.Validate() )
	{
		delete hGameData;

		SetFailState( "Unable to validate patch for \"trigger_finale condition\"" );
	}

	hMemoryPatcher.Enable();
}

public Plugin myinfo =
{
	name = "[L4D2] No Sacrifice Finale Failure",
	author = "Justin \"Sir Jay\" Chellah",
	description = "QoL change which allows The Sacrifice finale to be completed even when there's just one survivor alive",
	version = "1.0.0",
	url = "https://justin-chellah.com"
};