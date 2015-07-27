// Downloaded from: http://will.kirk.by/labs/tt/edge/level.bin
// Modified by: Mygod 2013.7.29

#define TIME_THRESHOLDS_LENGTH 5

struct edge_level {
        level_header header;    // quick access to data used for the level-select screen
        char size_z;
        short size_x;
        short size_y;
        short unknown_short_1;  // size_x + size_y
        short unknown_short_2;  // size_x + size_y + (2 * size_z)
        short unknown_short_3;  // (unknown_short_1 + 9) / 10
        short unknown_short_4;  // (unknown_short_2 + 9) / 10
        char unknown_byte_1;    // 10
        short unknown_short_5;  // size_y - 1
        short unknown_short_6;  // 0
        char *legacy_minimap;   // length = ((unknown_short_3 * unknown_short_4) + 7) / 8
        char *collision_map;    // length = size_z * (((size_x * size_y) + 7) / 8)
        vector spawn_point;
        short zoom;
        // if zoom < 0
                short value;
                bool value_is_angle;    // value is field of view if false
        // endif
        vector exit_point;
        short moving_platform_count;
        moving_platform *moving_platforms;
        short bumper_count;
        bumper *bumpers;
        short falling_platform_count;
        falling_platform *falling_platforms;
        short checkpoint_count;
        checkpoint *checkpoints;
        short camera_trigger_count;
        camera_trigger *camera_triggers;
        short prism_count;
        prism *prisms;
        short fans_count;       // deprecated, presumably would have been followed by fan *fans;
        short block_event_count;
        block_event *block_events;
        short button_count;
        button *buttons;
        short othercube_count;
        othercube *othercubes;
        short resizer_count;
        resizer *resizers;
        short mini_blocks_count;        // deprecated, presumably would have been followed by mini_block *mini_blocks;
        char theme;
        char music_j2me;
        char music;
};

struct level_header {
        int level_id;
        int title_length;
        char* title;
        short time_thresholds[TIME_THRESHOLDS_LENGTH];
        short prisms_count;
};

struct vector {
        short x;
        short y;
        short z;
};

struct moving_platform {
        char auto_start;    
                // auto_start == 0: inactive
                // auto_start == 2: active (or any value that is not zero)
        char loop_start_index;
        short clones;   // deprecated, do not use
        bool full_block;
        char waypoints_count;
        waypoint *waypoints;
};

struct waypoint {
        vector position;
        short travel_time;
        short pause_time;
};

struct bumper {
        bool enabled;
        vector position;
        bumper_side north;      // assuming north as -Y in blockspace, top-right in screenspace
        bumper_side east;
        bumper_side south;
        bumper_side west;
};

struct bumper_side {
        short start_delay;
        short pulse_rate;
};

struct falling_platform {
        vector position;
        short float_time;
};

struct checkpoint {
        vector position;
        short respawn_z;
        char radius_x;
        char radius_y;
};

struct camera_trigger {
        vector position;
        short zoom;
        char radius_x;
        char radius_y;
        // if zoom == -1
                bool reset;
                short start_delay;
                short duration;
                short value;
                bool single_use;
                bool value_is_angle;      // value is field of view if false
        // endif
};

struct prism {
        vector position;
        char energy;    // deprecated, do not use
};

struct block_event {
        char type;
        short block_id;
        short payload;
        /*
                type == 0:
                        affects moving_platforms[block_id]
                        payload == 0:
                                traverse all waypoints
                        payload != 0:
                                traverse `payload` waypoints.
                type == 1:
                        affects bumpers[block_id]
                        payload == 0:
                                if bumper is running, stop it
                                else fire it once
                        payload == 1:
                                start the bumper and enable looping
                type == 2:
                        triggers achievements.
                        block_id is the achievement ID
                        payload is additional metadata that varies between different achievements.
                type == 3:
                        affects buttons[block_id]
                        payload == 0:
                                enable the button (pop it up)
                        payload == 1:
                                disable the button
        */
};

struct button {
        char visibility;
                // visibility == 0: invisible
                // visibility == 1: visible, solid
                // visibility == 2: visible, ghosted
        char disable_count;
				// after a button has been pressed `disable_count` times, it cannot be re-enabled by an event.
				// disable_count = 0 can be re-enabled as many times as you like.
        char mode;
                // mode == 0: reverses the event when the button is released
                // mode == 1: event is permanent, button stays up when released
                // mode == 2: event is permanent, button stays down when released
        short parent_id;
        bool sequence_in_order;
        byte siblings_count;
        bool is_moving;
        // if is_moving
                short moving_platform_id;
        // else
                vector position;
        // endif
        short event_count;
        short *events;
        /*
                this is a tricky one so I feel it needs to be explained.
                a standalone button uses
                        visibility
                        disable_count
                        mode
                        is_moving (and related position system)
                        event_count
                        events

                a button sequence uses all of those and more.
                a button sequence consists of multiple buttons which when all pressed will activate a collection of events.
                a button sequence can insist that the buttons be pressed in a particular order.
                a button sequence has a 'parent' button and a series of 'child' buttons.
                only the parent trigger should have events tied to it.
                the parent and children should all have these properties:
                        sequence_in_order = <true/false>
                        mode = 2
                the parent has these properties:
                        parent_id = -1 (default)
                        siblings_count = <number of child buttons>
                        events = <array of event ids>
                the children have these properties:
                        parent_id = <index of the parent in the buttons array>
                        siblings_count = 0
        */
};

struct othercube {
        vector position_trigger;
        short moving_block_sync;        // id of a looped moving block to sync to. -1 for no sync.
        // if moving_block_sync == -2 (then it's a dark cube)
                char darkcube_radius_x;
                char darkcube_radius_y;
                short darkcube_moving_block_sync;
        // endif
        short key_event_count;
        vector position_cube;
        key_event *key_events;  // interesting that this isn't immediately after its length...
};

struct key_event {
        short time_offset;
        char direction;
                // direction == 0: west
                // direction == 1: east
                // direction == 2: north
                // direction == 3: south
                // assuming, as earlier, north to be -Y in blockspace, top-right in screenspace
        char event_type;
                // event_type == 0: key down
                // event_type == 1: key up
};

struct resizer {
        vector position;
        bool visible;
        char direction;
                // direction == 0: shrink
                // direction == 1: grow
};