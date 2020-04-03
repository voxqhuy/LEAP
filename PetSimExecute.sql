-- Welcome to Virtual Pet Simulator!
    Exec RunPetSimulator 
        @Pet = --'New:03:Trace'   
                '1'
                -- 'View'
                -- 'New:[AnimalTypeID]:[Name]'
                
                -- Enter the ID of the Pet you wish to interact with
                -- Enter 'View' to see a list of all Pets (@Action and @Feed will be ignored)
                -- For a new pet enter 'New:[AnimalTypeID]:[Name]'
                        -- Animal Types
                        -- 01 -- Cat    
                        -- 02 -- Dog
                        -- 03 -- Horse
                        -- 04 -- Fish
                        -- 05 -- Snake
        
        ,@Action = 
                     'None'
                    -- 'Walk'
                    -- 'Bath'
                    -- 'Cuddle'
                    -- 'Scold'
                    -- 'Praise'
                    -- 'Play'
        
        ,@Feed =
                    -- 'None'
                    -- 'Tuna'
                    -- 'Kitty Kibble'
                    -- 'Puppy Chow'
                    -- 'Hay'
                    -- 'Apple'
                    -- 'Cricket'
                    -- 'Unfortunate Mouse'
                    -- 'Milk'
                    -- 'Turkey'
                     'Flaky Food'