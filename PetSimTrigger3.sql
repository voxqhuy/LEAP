-- This Trigger updates the death of an animal who falls below -50 Affection Level
    CREATE TRIGGER DeathAffectionLevel on Pets
    After Update
    As
    Set NoCount ON
    If update(AffectionLevel)
    begin
        Update Pets set DateTimeDeath = GETDATE()
        where AffectionLevel < -50
    END