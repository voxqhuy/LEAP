-- To Create triggers, please ensure that all code except for the trigger you wish to create are commented out
    -- You can only create one trigger at a time.  There are 3 triggers in this file.

-- This Trigger updates the StateID of animals any time a change is made to the EnergyLevel or AffectionLevel collumns
    --1 'Living its Best life' (EnergyLevel > 0 and EnergyLevel <= 40 and AffectionLevel > 0 and AffectionLevel <= 50)
    --2 'Ready to be left alone!!!' (EnergyLevel > 0 and EnergyLevel < 40 and AffectionLevel > 50)
    --3 'Overly Energized' (EnergyLevel > 40 and AffectionLevel > -40)
    --4 'Low Energy' (EnergyLevel <= 0 and AffectionLevel >= EnergyLevel)
    --5 'The abandonment is getting real' (AffectionLevel <= 0 and AffectionLevel < EnergyLevel)
   
    CREATE TRIGGER StateChange on Pets
    After Update
    As
    Set NoCount ON
    If update(AffectionLevel) or update(EnergyLevel)
    begin
        Update Pets set StateID = 
            Case 
                When (EnergyLevel > 0 and EnergyLevel < 40 and AffectionLevel > 0 and AffectionLevel < 50) 
                    Then 1
                When (EnergyLevel > 0 and EnergyLevel < 40 and AffectionLevel >= 50)
                    Then 2
                When (EnergyLevel >= 40 and AffectionLevel >= -EnergyLevel)
                    Then 3
                When (EnergyLevel <= 0 and AffectionLevel >= EnergyLevel)
                    Then 4
                When (AffectionLevel <= 0 and AffectionLevel < EnergyLevel)
                    Then 5
            END
    END;

-- This Trigger updates the death of an animal who falls below -50 Energy Level
    -- CREATE TRIGGER DeathEnergyLevel on Pets
    -- After Update
    -- As
    -- Set NoCount ON
    -- If update(EnergyLevel)
    -- begin
    --     Update Pets set DateTimeDeath = GETDATE()
    --     where EnergyLevel < -50 or EnergyLevel >50
    -- END


-- This Trigger updates the death of an animal who falls below -50 Affection Level
    -- CREATE TRIGGER DeathAffectionLevel on Pets
    -- After Update
    -- As
    -- Set NoCount ON
    -- If update(AffectionLevel)
    -- begin
    --     Update Pets set DateTimeDeath = GETDATE()
    --     where AffectionLevel < -50
    -- END


-- Here are drops if needed
    --Drop TRIGGER DeathEnergyLevel
    --Drop TRIGGER DeathAffectionLevel
    --Drop TRIGGER StateChange


